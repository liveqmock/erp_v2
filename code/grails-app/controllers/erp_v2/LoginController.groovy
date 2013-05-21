package erp_v2

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
		[ip:request.getHeader('X-Real-IP')?:request.getRemoteAddr()]
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

		if (user.password != params.password.encodeAsSHA1()) {
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
		if (params.next) {
			redirect(uri: params.next)
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
}
