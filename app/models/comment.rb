class Comment < ActiveRecord::Base
	belongs_to	:mind
	belongs_to	:user
	has_one		:user_comment_mark
end
