package erp_v2

class SecurityFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
	            if (!controllerName) return true
	            if (!session.user && !(controllerName in ['login', 'jcaptcha'])) {
		            redirect(controller:'login')
		            return false
	            }
            }
        }
    }
    
}
