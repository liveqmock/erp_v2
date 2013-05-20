package erp_v2

/**
 * @author yinheli
 */
class StoreProduct {

	Store store
	Product product
	Long stock
	Long cost
	Long currentSale
	Date productionDate
	Date guaranteeDate
	Brand brand
	Integer saleStatus
	Date timeCreate
	Date timeUpdate
	Integer storeStatus
	Long inputId
	Long tbNumIid

	static constraints = {
		store(nullable: false)
		product(nullable: false)
		stock(nullable: false, min: 0L)
		cost(nullable: false, min: 0L)
		currentSale(nullable: false, min: 0L)
		productionDate(nullable: false)
		guaranteeDate(nullable: false)
		brand(nullable: false)
		saleStatus(inList: saleStatusMap.keySet().toList())
		timeCreate(nullable: false)
		storeStatus(inList: storeStatusMap.keySet().toList())
		inputId(nullable: false)
	}

	static mapping = {
		saleStatus(type: 'int')
		storeStatus(type: 'int')
	}

	static saleStatusMap = [0:'待售', 1:'销售中', 2: '下架']
	static storeStatusMap = [0:'申请', 1: '在途', 2: '入库']
}
