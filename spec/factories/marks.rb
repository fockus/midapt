FactoryGirl.define do
  sequence :valid_mark_mark do
    [-1, 1].sample
  end

  sequence :negative_mark_mark do
    Forgery(:basic).number(:at_least => -1000, :at_most => -2)
  end

  sequence :positive_mark_mark do
    Forgery(:basic).text(:at_least => 2, :at_most => 1000)
  end

  sequence :zero_mark_mark do
    0
  end

  sequence :invalid_mark_mark do
    FactoryGirl.generate(:zero_mark_mark)
  end

  factory :mark do
    user
    mark { FactoryGirl.generate(:valid_mark_mark) }
  end

  factory :invalid_mark, class: Mark do
    user
    mark { FactoryGirl.generate(:invalid_mark_mark) }
  end
end