json.array!(@marks) do |mark|
  json.extract! mark, :id, :mark
  json.url mark_url(mark, format: :json)
end
