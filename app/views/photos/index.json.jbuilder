json.array!(@photos) do |photo|
  json.extract! photo, :id, :image_url
  json.url photo_url(photo, format: :json)
end
