package erp_v2

import com.taobao.api.DefaultTaobaoClient
import com.taobao.api.internal.util.AtsUtils
import com.taobao.api.internal.util.TaobaoUtils
import com.taobao.api.request.TopatsResultGetRequest
import com.taobao.api.request.TopatsTradesSoldGetRequest
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ErpTestController {

	def index = {
		// 爱莎海 / lqh_79863397
		def cfg = ConfigurationHolder.config.taobao
		def client = new DefaultTaobaoClient('https://eco.taobao.com/router/rest', cfg.appkey, cfg.appsecret, 'json')
		def token = User.findByTaobaoUserNick('爱莎海').accessToken

//		def q = new TopatsTradesSoldGetRequest()
//		q.startTime = '20130501'
//		q.endTime = '20130526'
//		q.fields = 'tid'
//		def r = client.execute(q, token)
//		println r
//		println '*' * 30
//		println '*' * 30
//		println  r.dump()


		def q = new TopatsResultGetRequest()
		q.taskId = 131493119L
		def r = client.execute(q, token)
		println r.dump()
		println  AtsUtils.download(r.task.downloadUrl, new File('d:/' + r.task.taskId))
		render('hello ' + r.task.status + ", " + r.task.downloadUrl)
	}
}
