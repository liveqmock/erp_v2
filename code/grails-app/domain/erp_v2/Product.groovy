package erp_v2

/**
 * @author yinheli
 */
class Product {

	String code
	String barCode
	String name
	String thumb
	Long stock
	Brand brand
	Cat cat
	Date timeCreate
	Date timeUpdate

	static constraints = {
		code(nullable: false, blank: false)
		barCode(blank: false)
		name(nullable: false, blank: false)
		thumb(blank: false)
		stock(nullable: false)
		cat(nullable: false)
		brand(nullable: false)
		timeCreate(nullable: false)
	}
}
