FactoryGirl.define do
  factory :mind do
    user
    text 'valid text'
  end

  factory :invalid_mind, class: Mind do
    user
    text ''
  end
end