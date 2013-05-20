package erp_v2


/**
 * @author yinheli
 */
class Refound {

	User applyUser
	User approveUser
	Long qty
	Long otherCost = 0
	Long logisticsCost = 0
	String logisticsNo
	String logisticsCompany
	Date timeCreate
	Date timeUpdate
	Date timeApply
	Date timeApproved
	Customer customer
	String approvedStatus
	String remark
	StoreOut storeOut

	static constraints = {
		applyUser(nullable: false)
		qty(nullable: false)
		otherCost(nullable: false)
		logisticsCost(nullable: false)
		logisticsNo(blank: false)
		logisticsCompany(blank: false)
		timeCreate(nullable: false)
		timeApply(nullable: false)
		customer(nullable: false)
		approvedStatus(inList: approvedStatusMap.keySet().toList())
		storeOut(nullable: false)
	}

	static approvedStatusMap = [submit: '提交', refuse: '拒绝']
}
