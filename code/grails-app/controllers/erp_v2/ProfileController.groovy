package erp_v2

class ProfileController {

	static layout = "default"

	def index = {
		[instance: User.get(session.user.id)]
	}

	def edit = {
	}
}
