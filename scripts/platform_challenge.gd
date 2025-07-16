extends Node2D

func _switch_on_all_platforms():
	var children = get_children()
	for child in children:
		if child is invisible_platform:
			child.show_bridge()

func _switch_off_all_platforms():
	var children = get_children()
	for child in children:
		if child is invisible_platform:
			child.hide_bridge()
