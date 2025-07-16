extends Button


# the name of the next scene- should be in the scenes folder- doesn;t need tscn 
@export var next_scene :=  ""




func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/"+next_scene+".tscn")
