package erp_v2

/**
 * @author yinheli
 */
class Store {

	String name
	String location
	Boolean enabled

	static constraints = {
		name(nullable: false, blank: false, maxSize: 64)
		location(nullable: false, blank: false, maxSize: 512)
	}

	static mapping = {
		enabled(type: 'int')
	}
}
