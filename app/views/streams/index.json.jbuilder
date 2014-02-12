json.array!(@streams) do |stream|
  json.extract! stream, :id, :name
  json.url stream_url(stream, format: :json)
end
