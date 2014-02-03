class Mind < ActiveRecord::Base
	belongs_to	:user
	has_many	:comments
	has_one		:user_mind_mark
	has_many	:mind_tag
	has_many	:tags, through: :mind_tag
end
