extends HBoxContainer

func update_label(new_label):
	$Name.text = new_label

func get_value():
	return $Value.text

func update_value(value):
	$Value.text = value

func toggle_visibility(state):
	visible = state
