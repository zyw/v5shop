class CreateDicts < ActiveRecord::Migration
  def change
    create_table :dicts do |t|
      t.string :name
      t.integer :dict_type_id
      t.text :intro

      t.timestamps
    end
  end
end
