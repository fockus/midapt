class UserMindMark < ActiveRecord::Base
	belongs_to :user
	belongs_to :mind
end
