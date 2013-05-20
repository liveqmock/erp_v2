package erp_v2

/**
 * @author yinheli
 */
class CustomerAddr {

	String province
	String city
	String addr
	String contactName
	String zip
	String tel
	String mobile
	Date timeCreate
	Date timeUpdate

	static belongsTo = [customer: Customer]

	static constraints = {
		province(nullable: false, blank: false, maxSize: 32)
		city(nullable: false, blank: false)
		addr(nullable: false, blank: false)
		contactName(nullable: false, blank: false)
		zip(nullable: false, blank: false)
		customer(nullable: false)
		timeCreate(nullable: false)
	}
}
