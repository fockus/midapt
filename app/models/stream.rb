class Stream < ActiveRecord::Base
	has_many	:marks, as: :markable

	has_many	:interests
	has_many	:users, through: :interests

	has_many	:mind_streams, :dependent => :destroy
	has_many	:minds, through: :mind_streams

	# Эта строчка сделала много говна и убила кучу моего времени. 
	# Антон, это хороший урок для тебя. Не вставляй код, если плохо понимаешь, что он делает!
	# Don't use validates_associated on both ends of your associations.
	# They would call each other in an infinite loop.
	#validates_associated :marks, :interests, :users, :mind_streams, :minds

	validates :name,
            presence: true,
            length: { minimum: 3, maximum: 30 }
end
