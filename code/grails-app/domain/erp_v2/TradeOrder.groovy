package erp_v2

/**
 * @author yinheli
 */
class TradeOrder {

	Long oid
	Integer num
	Long numIid
	String status
	String title
	Long price
	Long payment
	Trade trade
	Logistics logistics
	StoreProduct localStoreProduct

	static belongsTo = [Trade]

	static constraints = {
		num(nullable: false, min: 1)
		status(inList: Trade.statusMap.keySet().toList())
		title(nullable: false, blank: false)
		price(nullable: false, min: 0L)
		payment(nullable: false, min: 0L)
		trade(nullable: false)
		localStoreProduct(nullable: false)
	}
}
