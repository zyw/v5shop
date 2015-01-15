module OrdersHelper
	def order_state(stateValue)
		return (Dict.find_by(dict_type_id: 6,value:stateValue)).name
	end
	def state_display(stateValue)
		if stateValue == -1
			return 'label-danger'
		elsif stateValue == 0
			return 'label-success'
		elsif stateValue == 5
			return 'btn-warning'
		else
			return 'label-info'
		end
	end
end
