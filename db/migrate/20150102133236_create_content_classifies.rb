class CreateContentClassifies < ActiveRecord::Migration
  def change
    create_table :content_classifies do |t|
      t.string :name
      t.string :intro

      t.timestamps
    end
  end
end
