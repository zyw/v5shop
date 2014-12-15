json.array!(@addresses) do |address|
  json.extract! address, :id, :contacts, :mobile_phone, :province, :city, :county, :detail, :user_id
  json.url address_url(address, format: :json)
end
