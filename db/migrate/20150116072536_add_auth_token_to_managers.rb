class AddAuthTokenToManagers < ActiveRecord::Migration
  def change
    add_column :managers, :auth_token, :string
  end
end
