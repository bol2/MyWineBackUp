json.array!(@wines) do |wine|
  json.extract! wine, :id, :image_url, :shortDescription, :bottleSize, :price, :company, :longDescription, :country, :grape, :vegetarians, :title
  json.url wine_url(wine, format: :json)
end
