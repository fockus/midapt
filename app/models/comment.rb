class Comment < ActiveRecord::Base
	belongs_to	:mind
	belongs_to	:user

	has_many	:marks, as: :markable  #Полиморфная асссоциация

  validates_associated :marks

  validates :message,
            presence: true,
            length: { minimum: 5, maximum: 200 }

end
