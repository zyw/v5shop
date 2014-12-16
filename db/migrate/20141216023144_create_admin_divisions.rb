class CreateAdminDivisions < ActiveRecord::Migration
  def change
    create_table :admin_divisions do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
