extends Area2D
signal placeddown
signal pickedup
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
	if body.name == "player":
		if body.has_lamp == true:
			$lamp.show()
			body.hidelamp()
			placeddown.emit()
		else:
			$lamp.hide()
			body.showlamp()
			pickedup.emit()
