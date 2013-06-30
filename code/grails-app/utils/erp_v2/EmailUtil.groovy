package erp_v2

import org.apache.commons.mail.HtmlEmail
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.slf4j.Logger
import org.slf4j.LoggerFactory

import java.util.concurrent.LinkedBlockingQueue
import java.util.concurrent.ThreadPoolExecutor
import java.util.concurrent.TimeUnit

/**
 * @author yinheli <yinheli@gmail.com>
 */
class EmailUtil {

	private static Logger log = LoggerFactory.getLogger(EmailUtil.class)

	static emailExecutor = new ThreadPoolExecutor(1, 5,	5L, TimeUnit.MINUTES, new LinkedBlockingQueue<Runnable>(10))

	public static send(final title, final content, final to, final cc = null, final bcc = null) {
		emailExecutor.execute(new Runnable() {
			@Override
			void run() throws Exception {
				def cfg = ConfigurationHolder.config.email
				def email = new HtmlEmail()
				email.setHostName cfg.host
				email.setSmtpPort cfg.port as int
				email.setAuthentication cfg.username, cfg.password
				email.setSSLOnConnect Boolean.parseBoolean(cfg.ssl)
				email.setFrom cfg.from, 'Love Nature ERP no-reply'
				email.setCharset 'UTF-8'
				email.setSubject title
				email.setHtmlMsg content
				if (to instanceof String) {
					email.addTo(to)
				} else {
					to.each {email.addTo(it)}
				}
				if (cc) {
					if (cc instanceof String) {
						email.addCc(cc)
					} else {
						cc.each {email.addCc(it)}
					}
				}
				if (bcc) {
					if (cc instanceof String) {
						email.addBcc(bcc)
					} else {
						bcc.each {email.addBcc(it)}
					}
				}
				try {
					def ret = email.send()
				} catch (e) {
					log.error e
				}
			}
		})

	}

}
