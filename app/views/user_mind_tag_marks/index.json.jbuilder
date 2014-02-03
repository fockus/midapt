json.array!(@user_mind_tag_marks) do |user_mind_tag_mark|
  json.extract! user_mind_tag_mark, :id, :mark
  json.url user_mind_tag_mark_url(user_mind_tag_mark, format: :json)
end
