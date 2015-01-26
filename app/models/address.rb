class Address < ActiveRecord::Base
	belongs_to :user

	has_many :orders,dependent: :destroy

	validates :contacts,presence: true
	validates :mobile_phone,presence: true,format: {with: /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/}
	validates :province,presence: true
	validates :city,presence: true
	validates :county,presence: true
	validates :detail,presence: true
end
