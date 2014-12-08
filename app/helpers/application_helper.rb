module ApplicationHelper
	def date_format(date)
		return date.strftime('%Y-%m-%d %H:%M:%S').to_s
	end
end
