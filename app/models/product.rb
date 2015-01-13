class Product < ActiveRecord::Base
	belongs_to :product_classify
	has_many :product_orders
	has_many :orders, through: :product_orders
end
