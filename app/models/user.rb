class User < ActiveRecord::Base

  ROLES = %w[admin moderator author banned]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

	has_many	:minds, :dependent => :destroy
	has_many	:comments, :dependent => :destroy
	has_many	:marks, :dependent => :destroy
	has_many	:interests, :dependent => :destroy
	has_many	:streams, through: :interests

	validates_associated :minds, :comments, :marks, :interests, :streams

  accepts_nested_attributes_for :minds, :allow_destroy => true 


  #validates :email,
  #          presence: true,
  #          uniqueness: { case_sensitive: false },
  #          email_format: { message: "is not an e-mail" }

end
