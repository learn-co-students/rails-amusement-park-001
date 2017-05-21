json.array!(@attractions) do |attraction|
  json.extract! attraction, :id
  json.url attraction_url(attraction, format: :json)
end
