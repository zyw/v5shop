class CenterController < ApplicationController
	before_action :check_user_login
	layout "front"

	def index
		
	end

	def order
		
	end

	def stow
	end

	def comment
		
	end
	def address
		@addresses = Address.where(user_id: session[:user_id]).order("created_at desc")
	end
	def address_new
		@adress = Address.new
		@first = AdminDivision.where(parent_id:0)
	end
	def address_create
		@address = Address.new(address_params)

		respond_to do |format|
		  if @address.save
		    format.html { redirect_to :center_address, notice: '添加地址成功。' }
		    format.json { render :show, status: :created, location: @address }
		  else
		    format.html { render :center_address_new }
		    format.json { render json: @address.errors, status: :unprocessable_entity }
		  end
		end
	end

	def address_edit
	end

	def address_update
		
	end

	def pwdupdate
		
	end

	def userinfo
		
	end

	private
		def address_params
	    	params.require(:address).permit(:contacts, :mobile_phone, :province, :city, :county, :detail, :user_id)
	    end
end
