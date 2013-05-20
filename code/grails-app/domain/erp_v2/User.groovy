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

	static constraints = {
		loginName(blank: false, nullable: false, maxSize: 32, minSize: 3)
		name(blank: false, nullable: false, maxSize: 32, minSize: 3)
		password(blank: false, nullable: false)
		regIp(blank: false, nullable: false)
		lastIp(blank: false, nullable: false)
		timeCreate(nullable: false)
		status(blank: false, nullable: false, inList: statusMap.keySet().toList())
	}

	def static statusMap = [normal: '正常', locked:'锁定', disabled: '停用', deleted: '删除']
}
