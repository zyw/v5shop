class OrderConfirmsController < ApplicationController
  layout "front",only:[:index]
  before_action :user_info,only: [:index]

  def index
  	@first = AdminDivision.where(parent_id:0)
  	@total = session[:service_total]
  end

  def find_ad
  	adpid = params[:adpid]
  	ads = AdminDivision.where(parent_id:adpid)
  	render json: ads
  end

  def order_submit
  	# puts "#{address_params}"

    dt = DateTime.now.strftime('%y%m%d%H%M%S%L')
    num = rand(9999999)
    while num.to_s.length != 7
      num = rand(9999999)
    end

    @address = Address.new(address_params)
    if @address.save
      puts "#{@address.id}==================="
      @order = Order.new
      @order.appoint_date = params[:appoint_date]
      @order.appoint_time = params[:appoint_time]
      @order.intro = params[:appoint_intro]
      @order.status = 0
      @order.total = session[:service_total]
      @order.address = @address
      @order.order_code = dt + (num.to_s)
      if @order.save
        format.html { redirect_to :navs, notice: '订单提交成功。' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    else
      format.html { render :new }
      format.json { render json: @address.errors, status: :unprocessable_entity }
    end
  	#puts "#{params[:appoint_date]}"
  	#puts "#{params[:appoint_time]}"
  	#puts "#{params[:appoint_intro]}"
  end

  private
  	def address_params
  	  params.require(:address).permit(:contacts, :mobile_phone, :province, :city, :county, :detail, :user_id)
  	end
end
