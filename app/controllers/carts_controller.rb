class CartsController < ApplicationController
	layout "front",only:[:index]

	def index
		pids = session[:cart_pids]
		if pids
			@products = Product.find(pids)
		else
			@products = []
		end
		@cpsn = session[:cart_ps_num]

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
		# 产品数量
		product = Product.find(pid)
		cpsn = session[:cart_ps_num]
		if !cpsn
			cpsn = Hash.new
			session[:cart_ps_num] = cpsn
		end

		if cpsn.has_key?(pid)
			if product.charge_type == 'num'
				pnum = cpsn[pid]
				cpsn[pid] = pnum.to_i + 1
			end
		else
			if product.charge_type == 'num'
				cpsn[pid] = 1
			else
				areas = Dict.where(dict_type_id: 3)
				cpsn[pid] = areas[0].value
			end
		end
		redirect_to :carts_list
	end

	def remove
		pid = params[:id]
		pids = session[:cart_pids]

		pids.delete(pid) if pids.include?(pid)

		cpsn = session[:cart_ps_num]
		cpsn.delete(pid) if cpsn.has_key?(pid)

		if pids.empty?
			render json: "{\"status\":2,\"message\":\"购物车为空了。\"}"
		else
			render json: "{\"status\":1,\"message\":\"购物车移除成功。\"}"
		end
	end
	
	def change_num
		key = params[:key]
		value = params[:value]
		cpsn = session[:cart_ps_num]
		cpsn[key] = value
		render json: "{\"status\":1,\"message\":\"改变购物车产品数量成功。\"}"
	end
end
