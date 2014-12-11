class CreateDictTypes < ActiveRecord::Migration
  def change
    create_table :dict_types do |t|
      t.string :name
      t.text :intro

      t.timestamps
    end
  end
end
