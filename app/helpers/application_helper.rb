module ApplicationHelper
	def date_format(date)
		return date.strftime('%Y-%m-%d %H:%M:%S').to_s
	end
	def status_format(value,one,zore)
		if value == 1
			return one
		else
			return zore
		end
	end

	def find_ad_id(id)
		return (AdminDivision.find(id)).name
	end
end
