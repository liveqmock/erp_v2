package erp_v2

/**
 * @author yinheli
 */
class StoreOut {

	User applyUser
	User approveUser
	Long qty
	Long cost
	Long sale
	Long logisticsCost
	String logisticsNo
	String logisticsCompany
	Logistics logistics
	Date timeCreate
	Date timeUpdate
	Date timeApply
	Date timeApproved
	String approvedStatus
	String remark

	static constraints = {
		applyUser(nullable: false)
		qty(nullable: false)
		cost(nullable: false, min: 0L)
		sale(nullable: false, min: 0L)
		logisticsCost(nullable: false, min: 0L)
		logisticsNo(blank: false)
		logisticsCompany(blank: false)
		timeCreate(nullable: false)
		approvedStatus(inList: approvedStatusMap.keySet().toList())
	}

	static approvedStatusMap = [submit: '提交', refuse: '拒绝']
}
