extends Button

@export var effects: CPUParticles2D
@export var sound_effect: AudioStreamPlayer2D

func _on_pressed() -> void:
	if effects:
		if effects.emitting:
			effects.restart()
		else:
			effects.emitting = true
	if sound_effect:
		sound_effect.play()
