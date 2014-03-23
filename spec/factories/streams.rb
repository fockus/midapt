FactoryGirl.define do
  factory :stream do
    name 'valid name'
  end

  factory :invalid_stream, class: Stream do
    name ''
  end
end