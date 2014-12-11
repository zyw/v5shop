json.array!(@dicts) do |dict|
  json.extract! dict, :id, :name, :dict_type_id, :intro
  json.url dict_url(dict, format: :json)
end
