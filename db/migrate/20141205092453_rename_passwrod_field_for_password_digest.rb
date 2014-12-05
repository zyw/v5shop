class RenamePasswrodFieldForPasswordDigest < ActiveRecord::Migration
  def up
    rename_column :managers, :password, :password_digest
  end
end
