class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: 'main')
		//"/"(view:"/index")
		"500"(view:'/error')
		"404"(view:'/404')
	}
}
