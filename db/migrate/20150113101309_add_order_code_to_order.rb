class AddOrderCodeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_code, :bigint, :unique => true, :limit => 30
  end
end
