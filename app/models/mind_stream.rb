class MindStream < ActiveRecord::Base
	belongs_to	:mind
	belongs_to  :stream
	
	has_many	:marks, as: :markable
end