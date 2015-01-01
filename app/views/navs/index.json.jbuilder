json.array!(@navs) do |nav|
  json.extract! nav, :id, :name, :url, :open_way, :sort_num, :status, :parent_id, :parent_ids, :intro
  json.url nav_url(nav, format: :json)
end
