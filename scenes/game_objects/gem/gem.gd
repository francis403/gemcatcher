extends Area2D
class_name Gem

signal gem_explosion_signal

@export var speed: float = 100

@onready var gem_explosion_sound: AudioStreamPlayer = %GemExplosionSound

func _process(delta: float) -> void:
	self.position.y = self.position.y + (speed * delta)
	
	if position.y > (self.get_viewport_rect().size.y + 50):
		set_process(false)
		gem_explosion_signal.emit()
		await play_explosion_sound()
		self.queue_free()
	
func play_explosion_sound():
	gem_explosion_sound.play()
	await gem_explosion_sound.finished
