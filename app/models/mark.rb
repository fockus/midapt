class Mark < ActiveRecord::Base
	belongs_to :user
	belongs_to :markable, polymorphic: true

  validates :mark, inclusion: {in: [-1, 1]}
end
