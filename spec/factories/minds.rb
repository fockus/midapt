FactoryGirl.define do
  factory :mind do
    text 'valid text'
  end

  factory :invalid_mind, class: Mind do
    text ''
  end
end