extends Node

@onready var paddle: CharacterBody2D = %Paddle
@onready var point_counter: Label = $PointCounter
@onready var gem_explosion_sound: AudioStreamPlayer = $GemExplosionSound
@onready var gem_generator_component: Node = $GemGeneratorComponent

var connected = false
var current_points = 0

func _ready() -> void:
	paddle.gem_caught.connect(on_gem_caught_signal)
	gem_generator_component.gem_created_signal.connect(on_gem_created_signal)
	

func on_gem_caught_signal():
	current_points += 1
	point_counter.text = str(current_points)


func on_gem_deleted_area_entered_signal(area: Area2D):
	area.queue_free()
	gem_explosion_sound.play()
	
	
func on_gem_created_signal(gem_instance: Gem):
	gem_instance.gem_explosion_signal.connect(game_over)
	connected = true
	
func game_over():
	get_tree().paused = true
	
