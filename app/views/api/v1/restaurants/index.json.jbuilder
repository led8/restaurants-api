json.restaurants do
  json.array! @restaurants do |restaurant|
    json.id restaurant.id
    json.name restaurant.name
    json.address restaurant.address
    json.comments restaurant.comments do |comment|
      json.id comment.id
      json.content comment.content
    end
  end
end
