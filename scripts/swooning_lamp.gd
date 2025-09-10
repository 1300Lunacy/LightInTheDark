extends Area2D


func _on_body_entered(body):
	if body.name == "player":
		$swoontime.start()


func _on_time_to_swoon_timeout():
	$SWOON.show()
	$lamp_destory.start()


func _on_lamp_destory_timeout():
	$lamp.hide()
	$SWOON.hide()
