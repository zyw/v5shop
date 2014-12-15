class AddValueToDicts < ActiveRecord::Migration
  def change
    add_column :dicts, :value, :string
  end
end
