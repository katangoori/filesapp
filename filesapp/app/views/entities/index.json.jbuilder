json.array!(@entities) do |entity|
  json.extract! entity, :id, :name, :entity_type, :entity_id
  json.url entity_url(entity, format: :json)
end
