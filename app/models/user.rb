class User < ActiveRecord::Base
	has_many	:minds
	has_many	:comments
	has_many	:streams, through: :interest
	has_many	:marks

end
