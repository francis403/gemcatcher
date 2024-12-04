extends Area2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	self.area_entered.connect(on_gem_deleted_area_entered_signal)


func on_gem_deleted_area_entered_signal(area: Area2D):
	# Do whatever needs to be done to take a life
	area.queue_free()
	audio_stream_player.play()
	get_tree().paused = true
