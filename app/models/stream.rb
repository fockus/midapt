class Stream < ActiveRecord::Base
	has_many	:marks, as: :markable

	has_many	:interests
	has_many	:users, through: :interests

	has_many	:mind_streams, :dependent => :destroy
	has_many	:minds, through: :mind_streams

	validates :name,
            presence: true,
            length: { minimum: 3, maximum: 30 }
end
