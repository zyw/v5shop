class WelcomeController < ApplicationController
	layout false
	def index
		user_id = session['user_id']
		if user_id !=nil
			user = User.find_by(id:user_id)
			@userName = user.name
		end
	end
end
