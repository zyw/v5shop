class Order < ActiveRecord::Base
	has_many :product_orders
	has_many :products, through: :product_orders

	belangs_to :user
	belangs_to :address
end
