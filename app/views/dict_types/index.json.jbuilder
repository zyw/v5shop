json.array!(@dict_types) do |dict_type|
  json.extract! dict_type, :id, :name, :intro
  json.url dict_type_url(dict_type, format: :json)
end
