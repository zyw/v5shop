class ChangeProducts < ActiveRecord::Migration
  def change
  	change_table :products do |t|
	  t.remove :dict_id
	  t.string :charge_type
	end
  end
end
