module OrderConfirmsHelper
	def find_ad_id(id)
		return (AdminDivision.find(id)).name
	end
end