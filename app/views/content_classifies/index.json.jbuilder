json.array!(@content_classifies) do |content_classify|
  json.extract! content_classify, :id, :name, :intro
  json.url content_classify_url(content_classify, format: :json)
end
