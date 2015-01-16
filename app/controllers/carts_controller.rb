class CartsController < ApplicationController
	layout "front",only:[:index]
	before_action :cart_info, only: [:index]

	def index
		
	end

	def add
		pid = params[:id]
		pids = session[:cart_pids]

		# 产品数量
		product = Product.find(pid)

		if !pids
			pids = Hash.new
			session[:cart_pids] = pids
		end

		if pids.has_key?(pid)
			if product.charge_type == 'num'
				pnum = pids[pid]
				pids[pid] = pnum.to_i + 1
			end
		else
			if product.charge_type == 'num'
				pids[pid] = 1
			else
				areas = Dict.where(dict_type_id: 3)
				pids[pid] = areas[0].value
			end
		end
=begin
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
=end

		redirect_to :carts_list
	end

	def remove
		pid = params[:id]
		pids = session[:cart_pids]

		pids.delete(pid) if pids.has_key?(pid)

		if pids.empty?
			render json: "{\"status\":2,\"message\":\"购物车为空了。\"}"
		else
			cart_info()
			render json: "{\"total\":\"#{@total}\",\"status\":1,\"message\":\"购物车移除成功。\"}"
		end
	end
	
	def change_num
		key = params[:key]
		value = params[:value]
		pids = session[:cart_pids]
		pids[key] = value
		cart_info()
		render json: "{\"total\":\"#{@total}\",\"status\":1,\"message\":\"改变购物车产品数量成功。\"}"
	end

	private
		def cart_info
			@pids = session[:cart_pids]
			if @pids
				pids = []
				@pids.each_key{ |key| pids.push(key.to_i)}

				@products = Product.find(pids)
			else
				@products = []
			end

			@areas = Dict.where(dict_type_id: 3)

			@total = 0
			@products.each do |product|
				if product.charge_type == 'num'
					@total = @total + (@pids[(product.id).to_s]).to_i * (product.feeScale).to_i
				else
					(0..(@areas.length-1)).each do |i|
						if @pids[product.id.to_s] == (@areas[i].value)
							@total = @total + ((i + 1) * (product.feeScale).to_i)
						end
					end
				end
			end
			session[:service_total] = @total
		end
end
