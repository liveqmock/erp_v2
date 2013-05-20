package erp_v2

/**
 * @author yinheli
 */
class Logistics {

	Long cost
	String logisticsCompany
	String invoiceNo
	Boolean bondOutFlag
	Customer customer
	CustomerAddr customerAddr

	static constraints = {
		cost(nullable: false)
		logisticsCompany(nullable: false, blank: false)
		invoiceNo(nullable: false, null: false)
		bondOutFlag(nullable: false)
		customer(nullable: false)
		customerAddr(nullable: false)
	}

	static mapping = {
		bondOutFlag(type: 'int')
	}
}
