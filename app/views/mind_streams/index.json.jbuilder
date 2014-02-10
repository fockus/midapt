json.array!(@mind_tags) do |mind_tag|
  json.extract! mind_tag, :id
  json.url mind_tag_url(mind_tag, format: :json)
end
