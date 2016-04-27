json.array!(@myfiles) do |myfile|
  json.extract! myfile, :id, :name
  json.url myfile_url(myfile, format: :json)
end
