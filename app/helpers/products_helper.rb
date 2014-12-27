module ProductsHelper
	def chargeType_format(data)
		return (Dict.find_by(dict_type_id: 1,value:data)).name
	end
end
