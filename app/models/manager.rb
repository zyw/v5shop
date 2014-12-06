class Manager < ActiveRecord::Base
	#attr_accessible :name,:icon,:email,:passwrod,:password_confirmation
	has_secure_password
end
