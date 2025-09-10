extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_timer_timeout():
	get_tree().change_scene_to_file(Globals.current_scene)
