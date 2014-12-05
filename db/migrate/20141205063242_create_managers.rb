class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.string :password
      t.string :email
      t.integer :loginNum
      t.string :icon

      t.timestamps
    end
  end
end
