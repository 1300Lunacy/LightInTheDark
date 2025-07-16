extends StaticBody2D

class_name switch_platform

@onready var collision_shape : CollisionShape2D = $CollisionShape2D

func show_switchbridge():
	$Sprite2D.show()
	collision_shape.set_deferred("disabled",false)
	
func hide_switchbridge():
	$Sprite2D.hide()
	collision_shape.set_deferred("disabled",true)
