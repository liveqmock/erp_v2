package erp_v2

/**
 * @author yinheli
 */
class Brand {

	String name
	String logo
	Date timeCreate
	Date timeUpdate
	Brand parent

	static constraints = {
		name(nullable: false, blank: false, maxSize: 128, minSize: 1)
		logo(nullable: true, blank: false)
		parent(nullable: true)
		timeCreate(nullable: false)
	}
}
