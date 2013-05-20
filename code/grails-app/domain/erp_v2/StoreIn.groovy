package erp_v2

/**
 * @author yinheli
 */
class StoreIn {

	User applyUser
	User approveUser
	String inputType
	Long qty
	String provider
	Store fromStore
	Store toStore
	Long cost
	Long logisticsCost = 0
	String logisticsNo
	String logisticsCompany
	Date timeCreate
	Date timeUpdate
	Date timeApply
	Date timeApproved
	String approvedStatus
	String remark

	static constraints = {
		applyUser(nullable: false)
		inputType(inList: inputTypeMap.keySet().toList())
		qty(nullable: false)
		provider(blank: false)
		toStore(nullable: false)
		cost(nullable: false, min: 0L)
		logisticsCost(nullable: false, min: 0L)
		logisticsNo(blank: false)
		logisticsCompany(blank: false)
		timeCreate(nullable: false)
		approvedStatus(inList: approvedStatusMap.keySet().toList())
	}

	static mapping = {
		fromStore(column: 'from_store')
		toStore(column: 'to_store')
	}

	static inputTypeMap = [move: '库间调拨', new: '进货', refound: '退货入库']
	static approvedStatusMap = [submit: '提交', refuse: '拒绝']

}
