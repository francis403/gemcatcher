extends CharacterBody2D

signal gem_caught

@export var speed: int = 225

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var star_collector_area: Area2D = %StarCollectorArea

func _ready() -> void:
	star_collector_area.area_entered.connect(on_area_entered_signal)

func _process(delta: float) -> void:
	#var movement_vector = get_movement_vector()
	#var direction = movement_vector.normalized()
	#var desired_velocity = direction * max_speed
	#velocity = velocity.lerp(desired_velocity, 1- exp(-acceleration * get_process_delta_time()))
	#self.move_and_slide()
	if Input.is_action_pressed("move_left"):
		self.position.x -= speed * delta
	elif Input.is_action_pressed("move_right"):
		self.position.x += speed * delta
	

#func get_movement_vector():
	#var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#return Vector2(x_movement, 0)

func get_movement_vector():
	#if Input.get_action_pressed("left"):
		#
	#var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#return Vector2(x_movement, 0)
	pass

func move():
	self.move_and_slide()
	#velocity = self.velocity
	
	
# Signals
func on_area_entered_signal(area: Area2D):
	print("Gem entered paddle area")
	area.get_parent().queue_free()
	gem_caught.emit()
	audio_stream_player.play()
