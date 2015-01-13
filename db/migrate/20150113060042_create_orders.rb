class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :appoint_date
      t.string :appoint_time
      t.integer :status
      t.string :total
      t.string :p_deduct
      t.integer :user_id
      t.integer :address_id
      t.string :intro

      t.timestamps
    end
  end
end
