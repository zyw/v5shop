class AddBirthdayAndSexToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :datetime
    add_column :users, :sex, :integer
  end
end
