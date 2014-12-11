class DictType < ActiveRecord::Base
	has_many :dicts,dependent: :destroy
end
