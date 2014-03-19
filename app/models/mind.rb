class Mind < ActiveRecord::Base
	belongs_to	:user
	
	has_many	:comments
	has_many	:marks, as: :markable

	has_many	:mind_streams, inverse_of: :mind, :dependent => :destroy
	has_many	:streams, through: :mind_streams


	validates :title,
		length: { in: 5..100 }, allow_blank: true

	validates :text,
		presence: true,
		length: { in: 5..1000 }

	attr_accessor :streams_string


end
