json.array!(@interests) do |interest|
  json.extract! interest, :id, :gravity
  json.url interest_url(interest, format: :json)
end
