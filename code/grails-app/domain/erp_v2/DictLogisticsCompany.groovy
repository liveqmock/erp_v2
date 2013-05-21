package erp_v2

class DictLogisticsCompany {

	String name
	String shortName
	String tel
	String note

	static constraints = {
		name(nullable: false, blank: false, maxSize: 64)
		shortName(nullable: true, blank: false, maxSize: 64)
		tel(nullable: true, blank: false)
		note(nullable: true, blank: false)
	}
}
