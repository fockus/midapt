class UserMindTagMark < ActiveRecord::Base
	belongs_to	:user
	belongs_to	:mind_tag	
end
