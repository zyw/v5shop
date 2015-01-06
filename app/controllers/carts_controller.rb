class CartsController < ApplicationController
	layout "front",only:[:index]

	def index
		pids = session[:cart_pids]
		if pids
			@products = Product.find(pids)
		else
			@products = []
		end
		@areas = Dict.where(dict_type_id: 3)
	end

	def add
		pid = params[:id]
		pids = session[:cart_pids]
		if pids
			if !pids.include?(pid)
				pids.push(pid)
			end
		else
			pids = [pid]
			session[:cart_pids] = pids
		end
		product = Product.find(pid)
		cpsn = session[:cart_ps_num]
		if cpsn == nil
			cpsn = Hash.new
		end

		if cpsn.has_key?(pid)

		else
			
		end
		redirect_to :carts_list
	end

	def remove
		pid = params[:id]
		pids = session[:cart_pids]
		if pids.include?(pid)
			pids.delete(pid)
		end
		if pids.empty?
			render json: "{\"status\":2,\"message\":\"购物车为空了。\"}"
		else
			render json: "{\"status\":1,\"message\":\"购物车移除成功。\"}"
		end
	end
end
