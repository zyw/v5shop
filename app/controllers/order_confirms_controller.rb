class OrderConfirmsController < ApplicationController
  layout "front",only:[:index]

  def index
  	@first = AdminDivision.where(parent_id:0)
  end

  def find_ad
  	adpid = params[:adpid]
  	ads = AdminDivision.where(parent_id:adpid)
  	render json: ads
  end

end
