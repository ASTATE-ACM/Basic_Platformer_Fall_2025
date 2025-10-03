extends CharacterBody2D

@export var animation: AnimatedSprite2D

var hor_move_speed: float = 50

var jump_power: float = -300
var gravity: float = 9.8

func _process(delta: float) -> void:
	velocity.y += gravity
	
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = jump_power
	
	var hor_movement_vector: float = 0
	if Input.is_action_pressed("left"):
		animation.flip_h = true
		hor_movement_vector = -1
	if Input.is_action_pressed("right"):
		animation.flip_h = false
		hor_movement_vector = 1
	
	velocity.x = hor_movement_vector * hor_move_speed
	
	if velocity.x != 0:
		animation.play("run")
	else:
		animation.play("idle")
	
	move_and_slide()
