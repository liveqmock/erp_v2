package erp_v2

import com.alibaba.fastjson.JSONObject
import com.taobao.api.internal.util.WebUtils
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class LoginController {

	def sysLogService

	def index = {
		if (session.user) {
			if (params.next) {
				redirect(uri: params.next)
			} else {
				redirect(controller: 'main')
			}
		}
		if (params.next) {
			session.next = params.next
		}
		def cfg = ConfigurationHolder.config.taobao
		def taobaoLoginUri = createLink(uri: "https://oauth.taobao.com/authorize?client_id=${cfg.appkey}&response_type=code&redirect_uri=${cfg.returnUri}")
		[ip:request.getHeader('X-Real-IP')?:request.getRemoteAddr(), taobaoLoginUri:taobaoLoginUri]
	}

	def doLogin = {
		if (!params.loginName || !params.password) {
			flash.message = '登录名或密码不能为空'
			redirect(action: 'index')
			return
		}

		def user = User.findByLoginName(params.loginName)
		if (!user) {
			flash.message = '用户不存在'
			redirect(action: 'index')
			return
		}

		def lastIp = user.lastIp
		def ip = request.getHeader('X-Real-IP')?:request.getRemoteAddr()
		user.lastIp = ip

		def errorStatusMsg = null
		if (user.status == 'locked') {
			errorStatusMsg = '用户已锁定'
		} else if (user.status == 'disabled') {
			errorStatusMsg = '用户已停用'
		} else if (user.status == 'deleted') {
			errorStatusMsg = '用户已删除'
		}

		if (errorStatusMsg) {
			flash.message = errorStatusMsg
			sysLogService.addlog(user, flash.message)
			redirect(action: 'index')
			return
		}

		if (user.password != ('erp.' + params.password).encodeAsSHA1()) {
			flash.message = '用户名或密码错误'
			sysLogService.addlog(user, '密码错误')
			redirect(action: 'index')
			return
		}

		// success
		session.ip = ip
		session.lastIp = lastIp
		session.user = user
		session.lastTimeLogin = user.timeLogin
		user.timeLogin = new Date()
		user.save(failOnError: true)
		sysLogService.addlog(session, '登录系统')
		log.info "登录成功: ${user.loginName}"
		def next = session.next
		session.removeAttribute('next')
		if (next) {
			redirect(uri: next)
		} else {
			redirect(controller: 'main')
		}
	}

	def logout = {
		if (session.user) {
			sysLogService.addlog(session, '退出系统')
		}
		session.user = null
		session.invalidate()

		flash.message = '您已成功退出系统'
		redirect(action: 'index')
	}

	private def updateTaobaoUserInfo(User user, info) {
		def now = System.currentTimeMillis()
		user.taobaoUserNick = info.taobao_user_nick ? URLDecoder.decode(info.taobao_user_nick, 'UTF-8') : null
		user.w1ExpiresIn    = (info.w1_expires_in as Long) * 1000 + now
		user.w2ExpiresIn    = (info.w2_expires_in as Long) * 1000 + now
		user.r1ExpiresIn    = (info.r1_expires_in as Long) * 1000 + now
		user.r2ExpiresIn    = (info.r2_expires_in as Long) * 1000 + now
		user.reExpiresIn    = (info.re_expires_in as Long) * 1000 + now
		user.tokenType      = info.token_type
		user.refreshToken   = info.refresh_token
		user.accessToken    = info.access_token
	}

	def taobaoAuth = {
		def code = params.code
		if (!code) {
			flash.message = '授权码错误'
			redirect(action:'index')
			return
		}

		if (params.error && params.error_description) {
			render("${params.error}, ${params.error_description}")
			return
		}

		def cfg = ConfigurationHolder.config.taobao
		def tokenUri = 'https://oauth.taobao.com/token'
		def resp = WebUtils.doPost(tokenUri, [
				grant_type    : 'authorization_code',
				code          : params.code,
				client_id     : cfg.appkey,
				client_secret : cfg.appsecret,
				redirect_uri  : cfg.returnUri,
				scope         : 'item',
				view          : 'web',
				state         : 'state',
		], 3000, 3000)

		def result = JSONObject.parse(resp)
		def user = User.findByTaobaoUserId(result.taobao_user_id as Long)
		if (!user) {
			session.taobaoLoginInfo = result
			redirect(action: 'bind', params: params)
			return
		}

		def lastIp = user.lastIp
		def ip = request.getHeader('X-Real-IP')?:request.getRemoteAddr()
		user.lastIp = ip

		def errorStatusMsg = null
		if (user.status == 'locked') {
			errorStatusMsg = '用户已锁定'
		} else if (user.status == 'disabled') {
			errorStatusMsg = '用户已停用'
		} else if (user.status == 'deleted') {
			errorStatusMsg = '用户已删除'
		}

		if (errorStatusMsg) {
			flash.message = errorStatusMsg
			sysLogService.addlog(user, flash.message)
			redirect(action: 'index')
			return
		}

		// success
		session.ip = ip
		session.lastIp = lastIp
		session.user = user
		session.lastTimeLogin = user.timeLogin
		user.timeLogin = new Date()
		updateTaobaoUserInfo(user, result)
		user.save(failOnError: true)
		sysLogService.addlog(session, '从淘宝账号登录系统')
		log.info "通过淘宝登录成功: ${user.loginName}, ${user.taobaoUserNick}"
		def next = session.next
		session.removeAttribute('next')
		if (next) {
			redirect(uri: next)
		} else {
			redirect(controller: 'main')
		}
	}

	def bind = {
		if (!session.taobaoLoginInfo) {
			redirect(action: 'index')
			return
		}

		def result = session.taobaoLoginInfo

		if (User.findByTaobaoUserId(result.taobao_user_id as Long)) {
			redirect(action: 'index')
			return
		}

		if (request.method.toLowerCase() == 'post') {
			if (!params.username || !params.password) {
				flash.message = '登录名或密码不能为空'
				return
			}

			def user = User.findByLoginName(params.username)
			if (!user || (user && user.password != ('erp.' + params.password).encodeAsSHA1())) {
				flash.message = '用户名或密码错误'
				return
			}

			def lastIp = user.lastIp
			def ip = request.getHeader('X-Real-IP')?:request.getRemoteAddr()
			user.lastIp = ip

			def errorStatusMsg = null
			if (user.status == 'locked') {
				errorStatusMsg = '用户已锁定'
			} else if (user.status == 'disabled') {
				errorStatusMsg = '用户已停用'
			} else if (user.status == 'deleted') {
				errorStatusMsg = '用户已删除'
			}

			if (errorStatusMsg) {
				flash.message = errorStatusMsg
				return
			}

			// success
			session.ip = ip
			session.lastIp = lastIp
			session.user = user
			session.lastTimeLogin = user.timeLogin
			user.timeLogin = new Date()
			user.taobaoUserId = result.taobao_user_id as Long
			user.taobaoBindIp = ip
			user.taobaoBindTime = new Date()
			updateTaobaoUserInfo(user, result)
			user.save(failOnError: true)
			sysLogService.addlog(session, '绑定淘宝账号并登录系统')
			log.info "绑定淘宝账号并登录系统成功: ${user.loginName}, ${result.taobao_user_nick}"
			session.removeAttribute('taobaoLoginInfo')
			def next = session.next
			session.removeAttribute('next')
			if (next) {
				redirect(uri: next)
			} else {
				redirect(controller: 'main')
			}
		}
	}
}
