package erp_v2

/**
 * @author yinheli
 */
class Cat {

	String name
	String description
	Date timeCreate
	Date timeUpdate
	Cat parent

	static constraints = {
		name(nullable: false, blank: false, maxSize: 64, minSize: 2)
		parent(nullable: true)
		timeCreate(nullable: false)
	}
}
