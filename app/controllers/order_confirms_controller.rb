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
  	puts "#{address_params}"
  	puts "#{params[:appoint_date]}"
  	puts "#{params[:appoint_time]}"
  	puts "#{params[:appoint_intro]}"
  end

  private
  	def address_params
  	  params.require(:address).permit(:contacts, :mobile_phone, :province, :city, :county, :detail, :user_id)
  	end
end
