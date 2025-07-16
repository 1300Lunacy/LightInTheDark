extends Area2D

signal activate

func _on_body_entered(body):
	if body.name == "player":
		activate.emit()
	
