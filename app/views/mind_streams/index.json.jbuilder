json.array!(@mind_streams) do |mind_stream|
  json.extract! mind_stream, :id
  json.url mind_stream_url(mind_stream, format: :json)
end
