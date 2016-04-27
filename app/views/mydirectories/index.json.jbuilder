json.array!(@mydirectories) do |mydirectory|
  json.extract! mydirectory, :id, :name
  json.url mydirectory_url(mydirectory, format: :json)
end
