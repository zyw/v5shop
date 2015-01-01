class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.text :content
      t.integer :nav_id
      t.integer :stick
      t.integer :stick_num
      t.integer :status
      t.string :pics
      t.string :dispics
      t.string :cattas
      t.integer :manager_id
      t.string :content_classify_id
      t.string :content_seo
      t.string :author
      t.string :source_url

      t.timestamps
    end
  end
end
