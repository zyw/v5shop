module ProductsHelper
	def chargeType_format(data)
		return (Dict.find_by(dict_type_id: 6,value:data)).name
	end
end
