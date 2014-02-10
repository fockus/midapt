class Stream < ActiveRecord::Base
	has_many	:marks, as: :markable
	has_many	:users, through: :interest
	has_many	:minds, through: :mind_stream
end
