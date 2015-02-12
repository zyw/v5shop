class Suggest < ActiveRecord::Base
  validates :name,presence: true
  validates :phone,presence: true,format: {with: /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/}
  validates :email,format: {with:/\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i}
end
