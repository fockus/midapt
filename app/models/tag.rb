class Tag < ActiveRecord::Base
  has_many	:mind_tag
  has_many	:minds, through: :mind_tag
end
