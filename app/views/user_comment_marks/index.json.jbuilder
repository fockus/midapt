json.array!(@user_comment_marks) do |user_comment_mark|
  json.extract! user_comment_mark, :id, :mark
  json.url user_comment_mark_url(user_comment_mark, format: :json)
end
