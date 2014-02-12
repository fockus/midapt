class User < ActiveRecord::Base
	has_many	:minds
	has_many	:comments
	has_many	:marks

	has_many	:interests
	has_many	:streams, through: :interests

end
