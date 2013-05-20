package erp_v2

/**
 * @author yinheli
 */
class Trade {

	Integer num
	Long tid
	Long numIid
	String status
	String title
	Long price
	String buyerNick
	Customer customer
	Long receivedPayment
	Long availableConfirmFee
	Date timeoutActionTime
	Integer localStatus
	Long localRefTrade

	static hasMany = [orders:TradeOrder]

	static constraints = {
		num(nullable: false, min: 1)
		status(inList: statusMap.keySet().toList())
		title(nullable: false, blank: false)
		price(nullable: false, min: 0L)
		buyerNick(nullable: false, blank: false)
		customer(nullable: false)
		receivedPayment(nullable: false, min: 0L)
		availableConfirmFee(nullable: false, min: 0L)
		localStatus(inList: localStatusMap.keySet().toList())
		orders(nullable: false)
	}

	static mapping = {
		localStatus(type: 'int')
		orders(joinTable: [name: 'trade_order', key:'id', column: 'trade_id'])
	}

	static statusMap = [
			TRADE_NO_CREATE_PAY      : '没有创建支付宝交易',
			WAIT_BUYER_PAY           : '等待买家付款',
			SELLER_CONSIGNED_PART    : '卖家部分发货',
			WAIT_SELLER_SEND_GOODS   : '等待卖家发货',
			WAIT_BUYER_CONFIRM_GOODS : '等待买家确认收货',
			TRADE_BUYER_SIGNED       : '买家已签收',
			TRADE_FINISHED           : '交易成功',
			TRADE_CLOSED             : '交易自动关闭',
			TRADE_CLOSED_BY_TAOBAO   : '卖家或买家主动关闭交易',
	]
	static localStatusMap = [0: '手工拆分', 1: '手工合并', 2:'本地订单']
}
