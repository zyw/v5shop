class CreateProductClassifies < ActiveRecord::Migration
  def change
    create_table :product_classifies do |t|
      t.string :name
      t.string :intro

      t.timestamps
    end
  end
end
