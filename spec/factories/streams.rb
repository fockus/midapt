FactoryGirl.define do
  sequence :valid_stream_name do
    Forgery(:basic).text(:at_least => 3, :at_most => 30)
  end

  sequence :short_stream_name do
    Forgery(:basic).text(:at_least => 1, :at_most => 2)
  end

  sequence :long_stream_name do
    Forgery(:basic).text(:at_least => 31, :at_most => 100)
  end

  sequence :invalid_stream_name do
    FactoryGirl.generate(:short_stream_name)
  end

  factory :stream do
    name { FactoryGirl.generate(:valid_stream_name) }
  end

  factory :invalid_stream, class: Stream do
    name { FactoryGirl.generate(:invalid_stream_name) }
  end
end