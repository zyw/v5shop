json.array!(@suggests) do |suggest|
  json.extract! suggest, :id, :name, :phone, :email, :content
  json.url suggest_url(suggest, format: :json)
end
