class Mind < ActiveRecord::Base
	belongs_to	:user
	
	has_many	:comments
	has_many	:marks, as: :markable

	has_many	:mind_streams
	has_many	:streams, through: :mind_streams

  validates_associated :comments, :marks, :mind_streams, :streams

  validates :question,
            length: { in: 5..100 }

  validates :text,
            presence: true,
            length: { in: 5..1000 }
end
