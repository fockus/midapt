json.array!(@user_mind_marks) do |user_mind_mark|
  json.extract! user_mind_mark, :id, :mark
  json.url user_mind_mark_url(user_mind_mark, format: :json)
end
