class CreateOrderCodes < ActiveRecord::Migration
  def change
    create_table :order_codes do |t|
      t.string :code

      t.timestamps
    end
  end
end
