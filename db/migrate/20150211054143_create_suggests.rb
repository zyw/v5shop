class CreateSuggests < ActiveRecord::Migration
  def change
    create_table :suggests do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :content

      t.timestamps
    end
  end
end
