extends Area2D

# the name of the next scene- should be in the scenes folder- doesn;t need tscn 
@export var next_scene :=  ""
@onready var collision_shape : CollisionShape2D = $CollisionShape2D

func _on_body_entered(body):
	#load another scene
	if body.name == "player":
		
		
		get_tree().change_scene_to_file("res://scenes/"+next_scene+".tscn")
		
