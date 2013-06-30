package erp_v2

import org.apache.commons.lang.RandomStringUtils
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ActiveController {

	def sysLogService

	def static defaultAction = "index"

	def index = {
		if (request.method.toLowerCase() == 'get') {
			if (!params.uid || !params.code) {
				render('无效参数'); return
			}

			def user = User.get(params.uid as Long)
			if (!user) {
				render('请求错误'); return
			}

			if (user.status != 'locked' ||
					user.resetActiveExpiresIn - System.currentTimeMillis() < 0 ||
					user.resetActiveCode != params.code) {
				render('链接失效'); return
			}

			session.activeingUser = user.loginName
			sysLogService.addlog(user, "请求重置 ${user.realname?:user.loginName}")
			return [instance: user]
		}

		if (!session.activeingUser) {
			render('非法请求'); return
		}

		def errormessage = null
		if (!params.username || !params.newpassword || !params.newpassword2) {
			errormessage = '请输入用户名和新密码!'
		}

		println session.activeingUser
		if (params.username != session.activeingUser) {
			errormessage = '用户名错误!'
		} else if (params.newpassword2 != params.newpassword) {
			errormessage = '两次密码输入不一致!'
		} else if (params.newpassword.length() < 6) {
			errormessage = '请使用相对复杂一点的密码'
		}

		if (errormessage) {
			flash.message = errormessage
		} else {
			def user = User.findByLoginName(session.activeingUser)
			user.password = ('erp.' + params.newpassword).encodeAsSHA1()
			user.timeUpdate = new Date()
			user.status = 'normal'
			user.resetActiveCode = null
			user.resetActiveExpiresIn = -1
			user.save(flush: true)
			session.removeAttribute('activeingUser')
			sysLogService.addlog(user, "密码重置 ${user.realname?:user.loginName}")
			flash.message = '密码重置成功, 请登录!'
			redirect(controller: 'login', action: 'index')
		}

	}

}
