package erp_v2

import org.codehaus.groovy.grails.commons.ConfigurationHolder

/**
 * @author yinheli <yinheli@gmail.com>
 */
class SyncTradeCronJob {
	static triggers = {
		def expression = ConfigurationHolder.config?.syncTradeCron ?: '0 0 8-20/1 * * ?'
		println "SyncTradeCronJob is cron: $expression"
		cron name: 'SyncTradeCronJob', cronExpression: expression
	}

	def execute() {
		println 'TODO SyncTradeCronJob'
	}
}
