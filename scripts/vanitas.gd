extends CharacterBody2D
@onready var player = get_tree().get_first_node_in_group("player")
@onready var vanitas = get_tree().get_first_node_in_group("vanitas")
@onready var enemy_curve
var active = false
var timer_started = false


#var player_position = player.global_position

func _process(delta):
	$AnimatedSprite2D.flip_h = velocity.x > 0
	if player.has_lamp == false and timer_started == false:
		print("has lamp set to false")
		timer_started = true

		$lamptime.start()
	if player.has_lamp == true and timer_started == true:
		print("skibidi stop")
		lamped()
		active = false
		timer_started = false
		$lamptime.stop()
	
		
		
	
	if active == true:
		var distance_to_enemy = (vanitas.global_position - player.global_position).length()

		velocity = position.direction_to(player.position) * (1 * distance_to_enemy + 1)
		#if distance_to_enemy <= player:#
			
		move_and_slide()
		print ("glupshitto")
		
	
func lamped():
	
	
	hide()
	print ("stop")


func _on_lamptime_timeout():
	$lamptime.stop()
	active = true
	show()
	print ("timer rah")
