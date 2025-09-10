extends CharacterBody2D


@export var SPEED = 225.0
@export var JUMP_VELOCITY = -550.0
@onready var coyote_timer = $Coyote
@onready var can_jump = true
@onready var _grace = is_on_floor()
var has_lamp = true
signal hit

func _ready():
	Globals.current_scene = get_tree().current_scene.scene_file_path


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if can_jump == false && is_on_floor():
		can_jump = true
		
	if Input.is_action_just_pressed("move_up") and can_jump:
		jump()
	
	if !_grace && can_jump && coyote_timer.is_stopped():
		coyote_timer.start()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	if velocity.x != 0 && is_on_floor():
		$lampyanny.animation = "walk"
		$yanny.animation = "walk"
		$lampyanny.flip_v = false
		$yanny.flip_v = false
		$lampyanny.flip_h = velocity.x < 0
		$yanny.flip_h = velocity.x < 0
	elif velocity.x == 0 && is_on_floor():
		$lampyanny.animation = "idle"
		$yanny.animation = "idle"
	





func jump():
	velocity.y = JUMP_VELOCITY
	can_jump = false
	$lampyanny.animation = "jump"
	$yanny.animation = "jump"
	
	
func  _on_coyote_timer_timeout():
	can_jump = false

func hidelamp():
	has_lamp = false
	$lampyanny.hide()
	$yanny.show()
	$dark.show()
	$dark2.show()
	$dark3.show()
	$dark4.show()

func showlamp():
	has_lamp = true
	$lampyanny.show()
	$yanny.hide()
	$dark.hide()
	$dark2.hide()
	$dark3.hide()
	$dark4.hide()

func die():
	hit.emit()
	queue_free()



func _on_area_2d_body_entered(body):
	print(body)
	if body.is_in_group("vanitas"):
		die()
		hit.emit()
		$CollisionShape2D.set_deferred("disabled", true)
