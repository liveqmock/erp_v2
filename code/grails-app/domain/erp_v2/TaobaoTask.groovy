package erp_v2

/**
 * @author yinheli
 */
class TaobaoTask {

	Long taskId
	User user
	String method
	Date timeCreated
	String status
	String downloadUri
	String fileUri
	Date timeChecked
	Date startTime
	Date endTime

	static constraints = {
		user(nullable: false)
	}

	static mapping = {
		id(generator: 'identity')
	}

}
