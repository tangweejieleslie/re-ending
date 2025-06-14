extends HBoxContainer

func update_label(new_label):
	$Name.text = new_label

func get_value():
	return $Value.text

func update_value(value):
	$Value.text = str(value)

func toggle_visibility(state):
	visible = state

func get_value_in_number():
	return $Value.to_int()
