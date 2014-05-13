FactoryGirl.define do
  factory :stream do
    name { Forgery(:basic).text(:at_least => 3, :at_most => 30) }
  end

  factory :invalid_stream, class: Stream do
    name { Forgery(:basic).text(:at_least => 1, :at_most => 2) }
  end
end