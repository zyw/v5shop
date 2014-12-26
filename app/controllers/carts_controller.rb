class CartsController < ApplicationController
	layout "front",only:[:index]
	def index
		puts "==================#{params[:id]}"
	end
end
