class CreateNavs < ActiveRecord::Migration
  def change
    create_table :navs do |t|
      t.string :name
      t.string :url
      t.string :open_way
      t.integer :sort_num
      t.integer :status
      t.integer :parent_id
      t.string :parent_ids
      t.string :intro

      t.timestamps
    end
  end
end
