FactoryGirl.define do
  sequence :valid_comment_message do
    Forgery(:basic).text(:at_least => 5, :at_most => 200)
  end

  sequence :short_comment_message do
    Forgery(:basic).text(:at_least => 1, :at_most => 4)
  end

  sequence :long_comment_message do
    Forgery(:basic).text(:at_least => 201, :at_most => 1000)
  end

  sequence :invalid_comment_message do
    FactoryGirl.generate(:short_comment_message)
  end

  factory :comment do
    message { FactoryGirl.generate(:valid_comment_message) }
  end

  factory :invalid_comment, class: Comment do
    message { FactoryGirl.generate(:invalid_comment_message) }
  end
end