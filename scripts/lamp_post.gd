extends Node2D

#@onready var collision_shape : CollisionShape2D = $CollisionShape2D




func _on_area_2d_body_entered(body):


	if body.name == "player":
		$swoontime.start()
		#collision_shape.set_deferred("disabled",true)
		print("touched")

func _on_swoontime_timeout():
	$SWOON.show()
	$lamp_destory.start()




func _on_lamp_destory_timeout():
	
	$lamp.hide()
	$SWOON.hide()
