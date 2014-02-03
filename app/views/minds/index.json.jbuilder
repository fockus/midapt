json.array!(@minds) do |mind|
  json.extract! mind, :id, :title, :text, :user_id
  json.url mind_url(mind, format: :json)
end
