package erp_v2

/**
 * @author yinheli
 */
class SysLog {

	User user
	String userRealname
	String content
	String ip
	Date timeCreate


	static constraints = {
		user(nullable: false)
		content(nullable: false, blank: false)
		ip(nullable: false, blank: false)
		timeCreate(nullable: false)
	}
}
