json.array!(@contents) do |content|
  json.extract! content, :id, :name, :content, :nav_id, :stick, :stick_num, :status, :pics, :dispics, :cattas, :manager_id, :content_classify_id, :content_seo, :author, :source_url
  json.url content_url(content, format: :json)
end
