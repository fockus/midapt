class MindTag < ActiveRecord::Base
	belongs_to	:mind
	belongs_to  :tag
	has_one		:user_mind_tag_mark
end
