class AddParentIdsToAdminDivisions < ActiveRecord::Migration
  def change
    add_column :admin_divisions, :parent_ids, :string
  end
end
