package erp_v2

/**
 * @author yinheli
 */
class Customer {

	String name
	String nikename
	String email
	String qq
	String tel
	String mobile
	Date timeCreate
	Date timeUpdate

	static constraints = {
		name(nullable: false, blank: false)
		nikename(nullable: false, blank: false)
		timeCreate(nullable: false)
	}
}
