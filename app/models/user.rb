class User < ActiveRecord::Base
	has_many	:minds
	has_many	:comments
	has_many	:marks
	has_many	:interests
	has_many	:streams, through: :interests

  validates_associated :minds, :comments, :marks, :interests, :streams

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            email_format: { message: "is not an e-mail" }

end
