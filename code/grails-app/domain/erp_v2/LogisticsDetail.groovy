package erp_v2

/**
 * @author yinheli
 */
class LogisticsDetail {

	String content
	Date timeCreate
	Date timeUpdate

	static belongsTo = [logistics:Logistics]

	static constraints = {
		logistics(nullable: false)
	}
}
