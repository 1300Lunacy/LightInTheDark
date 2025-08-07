@tool
extends Node2D
@export var process_x: bool = false
@export var process_y: bool = false
@export var factor: int = 10
@export var curve: Curve

var time: float = 0

var dir: int = 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Curve:
		time += delta * dir
	if process_x:
		position.x = curve.sample(time) * factor
	if process_y:
		position.x = curve.sample(time / 2) * (factor / 2)
