class Mind < ActiveRecord::Base
	belongs_to	:user
	
	has_many	:comments
	has_many	:marks, as: :markable
	has_many	:streams, through: :mind_streams
end
