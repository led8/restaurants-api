json.comments do
  json.array! @comments do |comment|
    json.id comment.id
    json.comment comment.content
  end
end
