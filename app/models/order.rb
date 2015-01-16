class Order < ActiveRecord::Base

	before_create { generate_order_code(:order_code) }

	has_many :product_orders
	has_many :products, through: :product_orders

	belongs_to :user
	belongs_to :address
	private
		def generate_order_code(column)
			begin
				# 订单号生成
			  	dt = DateTime.now.strftime('%y%m%d%H%M%S%L')
			    num = rand(9999999)
			    while num.to_s.length != 7
			      num = rand(9999999)
			    end
				self[column] = dt + (num.to_s)
			end while Order.exists?(column => self[column])
		end
end
