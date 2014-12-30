class AddProductClassifyIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_classify_id, :integer
  end
end
