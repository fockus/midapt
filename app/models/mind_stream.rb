class MindStream < ActiveRecord::Base
	belongs_to	:mind
	belongs_to  :stream
	
	has_many	:marks, as: :markable

	validates_associated :marks
	validates_presence_of :mind
	validates_presence_of :stream
	
end
