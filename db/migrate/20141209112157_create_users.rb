class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :mobile_phone
      t.string :password_digest
      t.string :portrait

      t.timestamps
    end
  end
end
