FactoryGirl.define do
  factory :mind do
    user
    text { Forgery(:basic).text(:at_least => 5, :at_most => 100)}
  end

  factory :invalid_mind, class: Mind do
    user
    text { Forgery(:basic).text(:at_least => 1, :at_most => 4)}
  end
end