class AddIpToSuggest < ActiveRecord::Migration
  def change
    add_column :suggests, :ip, :string
  end
end
