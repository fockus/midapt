class Comment < ActiveRecord::Base
	belongs_to	:mind
	belongs_to	:user

	has_many	:marks, as: :markable  #Полиморфная асссоциация
end
