FactoryGirl.define do
  sequence :valid_mind_title do
    Forgery(:basic).text(:at_least => 5, :at_most => 100)
  end

  sequence :short_mind_title do
    Forgery(:basic).text(:at_least => 1, :at_most => 4)
  end

  sequence :long_mind_title do
    Forgery(:basic).text(:at_least => 101, :at_most => 1000)
  end

  sequence :valid_mind_text do
    Forgery(:basic).text(:at_least => 5, :at_most => 1000)
  end

  sequence :short_mind_text do
    Forgery(:basic).text(:at_least => 1, :at_most => 4)
  end

  sequence :long_mind_text do
    Forgery(:basic).text(:at_least => 1001, :at_most => 1000000)
  end

  sequence :invalid_mind_title do
    FactoryGirl.generate(:short_mind_title)
  end

  sequence :invalid_mind_text do
    FactoryGirl.generate(:short_mind_text)
  end

  factory :mind do
    user
    title { FactoryGirl.generate(:valid_mind_title) }
    text { FactoryGirl.generate(:valid_mind_text) }
  end

  factory :invalid_mind, class: Mind do
    user
    title { FactoryGirl.generate(:invalid_mind_title) }
    text { FactoryGirl.generate(:invalid_mind_text) }
  end
end