package erp_v2

import org.apache.commons.lang.RandomStringUtils
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class UserController {

	static layout = "default"

	def sysLogService

	def size = ConfigurationHolder.config.get('view.page.size', 10)

	def list = {
		params.max    = size
		params.offset = (Integer.parseInt(params.p?:'1') - 1) * size
		params.sort = 'id'
		params.order = 'desc'
		[list:User.list(params), total: Math.ceil(User.count() / size) as int]
	}

	def create = {
		def user = new User()
		user.properties = params
		user.password = null
		[instance: user]
	}

	def edit = {
		def user = User.get(params.id as Long)
		if (user) {
			render(view: 'create', model: [instance: user])
		} else {
			redirect(action: 'list')
		}
	}

	def delete = {
		def user = User.get(params.id as Long)
		if (!user || user.loginName?.toLowerCase() == 'yinheli') {
			redirect(action: 'list')
			return
		}

		user.status = 'deleted'
		user.save()

		sysLogService.addlog(session, "删除用户${user.realname?:user.loginName}")

		def refer = request.getHeader('Referer')
		if (refer) {
			redirect(uri: refer)
		} else {
			redirect(action: 'list')
		}
	}

	def save = {
		def user = null
		if (params.id) {
			user = User.get(params.id as Long)
			def pwd = user.password
			user.properties = params
			user.password = pwd
			user.timeUpdate = new Date()
			user.save(flash: true)
		} else {
			user = new User()
			if (params.password != params.password2) {
				user.errors.reject('password', '两次密码输入不一致')
				render view: 'create', model: [instance: user]
				return
			}
			user.properties = params
			user.password = ('erp.' + params.password).encodeAsSHA1()
			user.timeCreate = new Date()
			user.save(flush: true)
		}
		sysLogService.addlog(session, "保存用户${user?.loginName}")
		if (user.hasErrors()) {
			render view: 'create', model: [instance: user]
		} else {
			redirect(action: 'list')
		}
	}

	def resetPassword = {
		if (!params.id) {
			redirect(action: 'list')
			return
		}
		def user = User.get(params.id as Long)
		if (!user) {
			redirect(action: 'list')
			return
		}

		def refer = request.getHeader('Referer')

		if (!user.email) {
			flash.message = '无邮箱, 无法重置'
			if (refer) {
				redirect(uri: refer)
			} else {
				redirect(action: 'list')
			}
			return
		}

		user.status = 'locked'
		user.password = "erp.${RandomStringUtils.randomAlphanumeric(12)}".encodeAsSHA1()
		user.resetActiveCode = UUID.randomUUID().toString().encodeAsSHA1()
		user.resetActiveExpiresIn = System.currentTimeMillis() + 3600 * 24 * 1000
		def emailContent = g.render(template: '/templates/reset_password_email', model: [user:user])
		EmailUtil.send('[Love Nature] 重置密码知会函', emailContent.toString(), user.email)
		sysLogService.addlog(session, "重置用户密码, ${user?.loginName}")

		flash.message = '重置成功!'

		if (refer) {
			redirect(uri: refer)
		} else {
			redirect(action: 'list')
		}
	}

	def setAsSyncId = {
		if (!params.id) {
			redirect(action: 'list')
			return
		}

		def user = User.get(params.id as Long)
		if (!user) {
			redirect(action: 'list')
			return
		}

		def refer = request.getHeader('Referer')

		if (!user.taobaoUserId || user.taobaoUserId <= 0) {
			flash.message = '该用户尚未绑定淘宝账号, 无法设置'
		} else if (!user.accessToken || user.w1ExpiresIn - System.currentTimeMillis() <= 0) {
			flash.message = '该用户的Accesstoken可能已经过期了. 请先用该用户登录, 刷新Token后再试'
		} else {
			User.executeUpdate("update from User set isPrimaryTaobaoUser=${false}")
			user.isPrimaryTaobaoUser = true
			user.save(flash: true)
			sysLogService.addlog(session, "设置为淘宝同步用户${user?.loginName}")
		}

		if (refer) {
			redirect(uri: refer)
		} else {
			redirect(action: 'list')
		}
	}

}
