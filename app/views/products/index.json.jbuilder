json.array!(@products) do |product|
  json.extract! product, :id, :name, :picture, :feeScale, :dict_id, :intro
  json.url product_url(product, format: :json)
end
