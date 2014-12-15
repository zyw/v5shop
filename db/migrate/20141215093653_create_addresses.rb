class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :contacts
      t.string :mobile_phone
      t.string :province
      t.string :city
      t.string :county
      t.string :detail
      t.integer :user_id

      t.timestamps
    end
  end
end
