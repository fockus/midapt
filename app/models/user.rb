class User < ActiveRecord::Base
	has_many	:minds
	has_many	:comments
	has_one		:user_comment_mark
	has_one		:user_mind_mark
	has_one		:user_mind_tag_mark

end
