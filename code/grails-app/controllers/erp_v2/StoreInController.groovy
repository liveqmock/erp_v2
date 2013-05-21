package erp_v2

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class StoreInController {

	static layout = "default"
	def size = ConfigurationHolder.config.get('view.page.size', 10)

	def index = {}

	def provider = {
		params.max    = size
		params.offset = (Integer.parseInt(params.p?:'1') - 1) * size
		params.sort = 'id'
		params.order = 'desc'
		[list:DictProvider.list(params), total: Math.ceil(DictProvider.count() / size) as int]
	}

	def providerCreate = {
		[instance: new DictProvider()]
	}

	def providerSave = {
		def provider = null
		if (params.id) {
			provider = DictProvider.get(params.id as Long)
			provider?.properties = params
		} else {
			provider = new DictProvider()
			provider.properties = params
		}
		provider?.save(flush: true)
		redirect(action: 'provider')
	}

	def providerEdit = {
		if (params.id) {
			def provider = DictProvider.get(params.id as Long)
			if (provider) {
				render(view: 'providerCreate', model: [instance: provider])
				return
			}
		}
		flash.message = '未找到'
		redirect(action: 'provider')
	}

	def providerDelete = {
		if (params.id) {
			DictProvider.get(params.id as Long)?.delete()
		}
		['max', 'offset', 'sort', 'order'].each {params.remove(it)}
		redirect(action: 'provider', params: params)
	}

	def providerShow = {
		def provider = null
		if (params.id) {
			provider = DictProvider.get(params.id as Long)
		}
		[instance: provider]
	}

	def storeInCreate = {
		//
	}
}
