class Stream < ActiveRecord::Base
	has_many	:marks, as: :markable

	has_many	:interests
	has_many	:users, through: :interests

	has_many	:mind_streams
	has_many	:minds, through: :mind_streams
end
