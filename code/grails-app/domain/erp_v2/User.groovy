package erp_v2

/**
 * @author yinheli
 */
class User {

	String loginName
	String name
	String realname
	String email
	String password
	String mobile
	String regIp
	String lastIp
	Date timeLogin
	Date timeCreate
	Date timeUpdate
	String status

	Boolean isPrimaryTaobaoUser = false
	Long taobaoUserId
	String taobaoUserNick
	Long w1ExpiresIn
	Long w2ExpiresIn
	Long r1ExpiresIn
	Long r2ExpiresIn
	Long reExpiresIn
	String tokenType
	String refreshToken
	String accessToken
	Date taobaoBindTime
	String taobaoBindIp

	static constraints = {
		loginName(blank: false, nullable: false, maxSize: 32, minSize: 3)
		name(blank: false, nullable: false, maxSize: 32, minSize: 3)
		password(blank: false, nullable: false)
		regIp(blank: false, nullable: false)
		lastIp(blank: false, nullable: false)
		timeCreate(nullable: false)
		status(blank: false, nullable: false, inList: statusMap.keySet().toList())
	}

	static mapping = {
		isPrimaryTaobaoUser(sqlType: 'int')
		w1ExpiresIn(column: 'w1_expires_in')
		w2ExpiresIn(column: 'w2_expires_in')
		r1ExpiresIn(column: 'r1_expires_in')
		r2ExpiresIn(column: 'r2_expires_in')
		reExpiresIn(column: 're_expires_in')
	}

	def static statusMap = [normal: '正常', locked:'锁定', disabled: '停用', deleted: '删除']
}
