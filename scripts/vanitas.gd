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
		$chase.stop()
	
		
		
	
	if active == true:
		var distance_to_enemy = (vanitas.global_position - player.global_position).length()
		if distance_to_enemy < 50:
			Globals.current_scene = get_tree().current_scene.scene_file_path
			get_tree().change_scene_to_file("res://scenes/death.tscn")
			
		velocity = position.direction_to(player.position) * (1 * distance_to_enemy + 1)
		#if distance_to_enemy <= player:#
			
		move_and_slide()
		
		
	
func lamped():
	
	
	hide()
	print ("stop")


func _on_lamptime_timeout():
	$lamptime.stop()
	active = true
	show()
	print ("timer rah")
	$rage.play()
	$chase.play()


func _on_player_hit():
	print("gotcha")
