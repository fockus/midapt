json.array!(@comments) do |comment|
  json.extract! comment, :id, :message, :mind_id
  json.url comment_url(comment, format: :json)
end
