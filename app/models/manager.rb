class Manager < ActiveRecord::Base
	#attr_accessible :name,:icon,:email,:passwrod,:password_confirmation

	before_create { generate_token(:auth_token) }

	has_secure_password

	validates :name,presence: true
	validates :email,presence: true
	# validates :password,length: { minimum: 6 }
	# validates :password_confirmation,confirmation: true

	private
		def generate_token(column)
			begin
				self[column] = SecureRandom.urlsafe_base64
			end while Manager.exists?(column => self[column])
		end
end
