json.array!(@posts) do |post|
  json.extract! post, :id, :name, :description, :category
  json.url post_url(post, format: :json)
end
