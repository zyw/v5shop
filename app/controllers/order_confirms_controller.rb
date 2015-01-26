class OrderConfirmsController < ApplicationController
  layout "front",only:[:index,:order_success,:order_submit]
  # before_action :user_info,only: [:index]

  def index
  	userId = session[:user_id]
  	if userId
  		@addresses = Address.where(user_id: userId)
  	else
  		@address = Address.new
  		@first = AdminDivision.where(parent_id:0)
  	end
  	@total = session[:service_total]
  end

  def find_ad
  	adpid = params[:adpid]
  	ads = AdminDivision.where(parent_id:adpid)
  	render json: ads
  end

  def order_submit
    # 创建订单和商品的中间表Model对象
    pids = session[:cart_pids]
	productOrders = []
	pids.each do |key,value|
		productOrders.push(ProductOrder.new(product_id: key,product_num: value))
	end

	# 构建订单实体
	@order = Order.new do |o|
		o.appoint_date = params[:appoint_date]
		o.appoint_time = params[:appoint_time]
		o.intro = params[:appoint_intro]
		o.status = 0
		o.total = session[:service_total]
		o.product_orders = productOrders
	end

  	addid = params[:address_id]
  	if addid
  		
  		@order.address = Address.find(addid)
		
		respond_to do |format|
	  		if @order.save
	  			format.html { redirect_to :order_success, notice: '订单提交成功。' }
		        format.json { render :show, status: :created, location: @order }
	  		else
	  			format.html { render :order_confirms }
		        format.json { render json: @order.errors, status: :unprocessable_entity }
	  		end
	  	end
  	else
		@address = Address.new(address_params)
		@address.orders = [@order]

	    respond_to do |format|
	  		if @address.save
	  			format.html { redirect_to :order_success, notice: '订单提交成功。' }
		        format.json { render :show, status: :created, location: @order }
	  		else
	  			@first = AdminDivision.where(parent_id:0)
	  			@total = session[:service_total]
	  			format.html { render :index }
		        format.json { render json: @order.errors, status: :unprocessable_entity }
	  		end
	  	end
  	end
  end

  def order_success
  	session[:service_total] = nil
  	session[:cart_pids] = nil
  	respond_to do |format|
  		format.html { render 'success' }
  	end
  end

  private
  	def address_params
  	  params.require(:address).permit(:contacts, :mobile_phone, :province, :city, :county, :detail, :user_id)
  	end
end
