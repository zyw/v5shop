class Manager < ActiveRecord::Base
	#attr_accessible :name,:icon,:email,:passwrod,:password_confirmation
	has_secure_password

	validates :name,presence: true
	validates :email,presence: true
	validates :passwrod,length: { minimum: 6 }
	validates :password_confirmation,confirmation: true
end
