json.array!(@product_classifies) do |product_classify|
  json.extract! product_classify, :id, :name, :intro
  json.url product_classify_url(product_classify, format: :json)
end
