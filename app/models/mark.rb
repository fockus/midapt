class Mark < ActiveRecord::Base
	belongs_to :user
	belongs_to :markable, polymorphic: true
end
