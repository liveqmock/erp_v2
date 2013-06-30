package erp_v2

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ProductController {

	def sysLogService

	static layout = "default"

	def size = ConfigurationHolder.config.get('view.page.size', 10)

	def index = {

	}

	def cats = {
		params.max    = size
		params.offset = (Integer.parseInt(params.p?:'1') - 1) * size
		params.sort = 'id'
		params.order = 'desc'
		[list:Cat.list(params), total: Math.ceil(Cat.count() / size) as int]
	}

	def catsAdd = {
		def cat = new Cat()
		cat.properties = params
		cat.timeCreate = new Date()
		cat.save(flush: true)
		sysLogService.addlog(session, "添加分类${cat.name}")
		redirect action: 'cats'
	}

	def catsEdit = {
		def cat = Cat.findById(Long.parseLong(params.id?:'-1'))
		if (request.method == 'POST') {
			if (cat) {
				cat.properties = params
				cat.timeUpdate = new Date()
				cat.save(flush: true)
				sysLogService.addlog(session, "更新分类${cat.name}")
			}
			redirect action: 'cats'
		} else {
			[cat: cat]
		}
	}

	def brands = {
		params.max    = size
		params.offset = (Integer.parseInt(params.p?:'1') - 1) * size
		params.sort = 'id'
		params.order = 'desc'
		[list:Brand.list(params), total: Math.ceil(Brand.count() / size) as int]
	}

	def brandsAdd = {
		def brand = new Brand()
		brand.properties = params
		brand.timeCreate = new Date()
		brand.save(flash: true)
		sysLogService.addlog(session, "添加品牌${brand.name}")
		redirect action: 'brands'
	}

	def brandsEdit = {
		def brand = Brand.findById(Long.parseLong(params.id?:'-1'))
		if (request.method == 'POST') {
			if (brand) {
				brand.properties = params
				brand.timeUpdate = new Date()
				brand.save(flush: true)
				sysLogService.addlog(session, "更新品牌${brand.name}")
			}
			redirect action: 'brands'
		} else {
			[brand: brand]
		}
	}

}
