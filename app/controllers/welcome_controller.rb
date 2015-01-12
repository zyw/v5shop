class WelcomeController < ApplicationController
	layout "front"
	before_action :user_info,only: [:index]
	
	def index
		
	end
end
