package erp_v2

import org.codehaus.groovy.grails.commons.ConfigurationHolder

/**
 * @author yinheli <yinheli@gmail.com>
 */
class SyncLogisticsCronJob {
	static triggers = {
		def expression = ConfigurationHolder.config?.syncLogisticsCron ?: '0 30 7-21/2 * * ?'
		println "SyncLogisticsCronJob is cron: $expression"
		cron name: 'SyncLogisticsCronJob', cronExpression: expression
	}

	def execute() {
		log.info 'TODO SyncLogisticsCronJob'
	}
}
