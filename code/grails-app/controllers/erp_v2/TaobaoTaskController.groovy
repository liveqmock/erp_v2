package erp_v2

import com.taobao.api.DefaultTaobaoClient
import com.taobao.api.internal.util.AtsUtils
import com.taobao.api.request.TopatsResultGetRequest
import com.taobao.api.request.TopatsTradesSoldGetRequest
import org.codehaus.groovy.grails.commons.ConfigurationHolder

import java.text.SimpleDateFormat

class TaobaoTaskController {

	static layout = "default"

	def sysLogService

	def cfg = ConfigurationHolder.config.taobao

	private static taobao_sync_dir = 'taobao_sync_dir'

	def size = ConfigurationHolder.config.get('view.page.size', 10)

	def index = {
		params.max    = size
		params.offset = (Integer.parseInt(params.p?:'1') - 1) * size
		params.sort = 'id'
		params.order = 'desc'
		[list:TaobaoTask.list(params), total: Math.ceil(TaobaoTask.count() / size) as int]
	}

	def addTask = {
		[instance: new TaobaoTask(startTime: new Date() - 89, endTime: new Date() - 1)]
	}

	/**
	 * 提交异步任务
	 */
	def sync = {
		if (!params.start || !params.end) {
			flash.message = '参数错误'
			redirect(action: 'index'); return
		}

		def user = User.find("from User u where u.isPrimaryTaobaoUser=${true}")
		if (!user) {
			flash.message = '淘宝用户未找到'
			redirect(action: 'index'); return
		}

		log.info "add sync task. userInfo: ${user.loginName}, ${user.taobaoUserNick}, ${user.taobaoUserId}"

		if (user.w1ExpiresIn - System.currentTimeMillis() < 0) {
			flash.message = "淘宝用户${user.taobaoUserNick}的授权已经过期!"
			redirect(action: 'index'); return
		}

		def client = new DefaultTaobaoClient(cfg.resetUri, cfg.appkey, cfg.appsecret, 'json')

		def q = new TopatsTradesSoldGetRequest()
		q.startTime = params.start
		q.endTime = params.end
		q.fields = 'tid'
		def r = client.execute(q, user.accessToken)
		log.info "task add result: ${r.dump()}"
		if (r && r.task) {
			log.info "task info ${r.task?.dump()}"
		}
		def taobaoTask = new TaobaoTask()
		taobaoTask.taskId = r.task.taskId
		taobaoTask.user = user
		taobaoTask.method = r.task.method
		taobaoTask.status = r.task.status
		taobaoTask.timeCreated = r.task.created
		taobaoTask.startTime = new SimpleDateFormat('yyyyMMdd HH:mm:ss').parse("${params.start} 00:00:00")
		taobaoTask.endTime = new SimpleDateFormat('yyyyMMdd HH:mm:ss').parse("${params.end} 23:59:59")
		taobaoTask.save(flush: true, failOnError: true, insert: true)

		params.id = taobaoTask.id
		checkStatus(params)

		redirect(action: 'index')

		sysLogService.addlog(session, "提交了订单同步任务: start:${params.start}, end:${params.end}, task:${taobaoTask.id}")
	}

	/**
	 * 检查异步任务
	 */
	def checkStatus = {
		def task = TaobaoTask.get(params.id as Long)
		if (!task) {
			flash.message = 'task not found'
			redirect(action: 'index'); return
		}

		def client = new DefaultTaobaoClient(cfg.resetUri, cfg.appkey, cfg.appsecret, 'json')
		def q = new TopatsResultGetRequest()
		q.taskId = task.taskId
		def r = client.execute(q, task.user.accessToken)
		if (r && r.task) {
			log.info "task info ${r.task?.dump()}"
		}
		task.status = r.task.status
		task.method = r.task.method
		task.downloadUri = r.task.downloadUrl
		task.timeChecked = new Date()
		if (task.downloadUri) {
			def dir = new File(ConfigurationHolder.config.dir.temp, taobao_sync_dir)
			def zipFile = AtsUtils.download(r.task.downloadUrl, dir)
			def file = AtsUtils.unzip(zipFile, dir).get(0)
			zipFile.delete()
			task.fileUri = file.absolutePath.replace(dir.absolutePath, '')
		}

		task.save(flush: true)

		sysLogService.addlog(session, "检查任务(${task.id}), 状态:${task.status}")

		def refer = request.getHeader('Referer')
		if (refer) {
			redirect(uri: refer)
		} else {
			redirect(action: 'index')
		}
	}

	/**
	 * 执行同步订单
	 */
	def doSyncDetial = {
		def task = TaobaoTask.get(params.id as Long)
		if (!task) {
			flash.message = 'task not found'
			redirect(action: 'index'); return
		}

		if (task.status == 'syncing') {
			flash.message = 'task is running!'
			redirect(action: 'index'); return
		}

		if (task.status != 'done') {
			flash.message = 'task is NOT finish!'
			redirect(action: 'index'); return
		}

		def dir = new File(ConfigurationHolder.config.dir.temp, taobao_sync_dir)
		def file = new File(dir, task.fileUri)
		task.status = 'syncing'
		task.save(flush: true)
		file.eachLine {
			println it
		}
		sysLogService.addlog(session, "执行同步 task: ${task.id}, fileUri: ${task.fileUri}")
		flash.message = '执行中请稍后...'
		redirect(action: 'index'); return
	}

	def delete = {
		def task = TaobaoTask.get(params.id as Long)
		if (!task) {
			flash.message = 'task not found'
			redirect(action: 'index'); return
		}

		if (task.status == 'lock') {
			flash.message = 'task is running!'
			redirect(action: 'index'); return
		}

		if (task.fileUri) {
			def dir = new File(ConfigurationHolder.config.dir.temp, taobao_sync_dir)
			def file = new File(dir, task.fileUri)
			if (file.exists()) {
				log.info "delete file:${file.absolutePath}"
				file.delete()
			}
		}

		task?.delete()

		def refer = request.getHeader('Referer')
		if (refer) {
			redirect(uri: refer)
		} else {
			redirect(action: 'index')
		}
	}

}
