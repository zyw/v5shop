class Content < ActiveRecord::Base
	belongs_to :nav
	belongs_to :content_classify
end
