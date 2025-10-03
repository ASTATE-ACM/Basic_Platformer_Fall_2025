extends CharacterBody2D

var horizontal_movement_speed: float = 100

var jump_power: float = 400
var gravity: float = 9.8

@export var animation: AnimatedSprite2D
@export var jump_sfx: AudioStreamPlayer2D
@export var step_timer: Timer
@export var step_sfx: AudioStreamPlayer2D

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = -jump_power
		jump_sfx.play()
	velocity.y += gravity
	
	var horizontal_movement_vector: float = 0
	if Input.is_action_pressed("left"):
		horizontal_movement_vector -= 1
	if Input.is_action_pressed("right"):
		horizontal_movement_vector += 1
	
	if is_on_floor():
		if horizontal_movement_vector > 0:
			animation.play("run")
			animation.flip_h = false
			if step_timer.is_stopped():
				step_sfx.play()
				step_timer.start()
		elif horizontal_movement_vector < 0:
			animation.play("run")
			animation.flip_h = true
			if step_timer.is_stopped():
				step_sfx.play()
				step_timer.start()
		else:
			animation.play("idle")
	else:
		if velocity.y < 0:
			animation.play("jump")
		else:
			animation.play("fall")
	
	velocity.x = horizontal_movement_vector * horizontal_movement_speed
	move_and_slide()
