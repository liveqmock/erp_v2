package erp_v2

class DictProvider {

	String name
	String addr
	String webSite
	String taxNo
	String accountNo1
	String accountNo2
	String contacts
	String contactsTel
	String contactsMobile
	String fax
	String email
	String wangwang
	String qq
	String remark

	static constraints = {
		name(nullable: false, blank: false, maxSize: 64)
		email(email: true)
	}
}
