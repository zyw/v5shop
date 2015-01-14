class AddOrderCodeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_code, :string, :unique => true
  end
end
