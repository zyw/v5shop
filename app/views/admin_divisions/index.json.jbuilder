json.array!(@admin_divisions) do |admin_division|
  json.extract! admin_division, :id, :name, :parent_id
  json.url admin_division_url(admin_division, format: :json)
end
