extends Node

signal gem_created_signal

@export var time_to_generate_gem = 5
@export var gem_scene: PackedScene

@onready var timer: Timer = $Timer

#var gem_scene = preload("res://scenes/game_objects/gem/gem.tscn")

func _ready() -> void:
	#timer.wait_time = 5
	timer.timeout.connect(on_timer_timeout)
	

func on_timer_timeout():
	var gem_instance: Gem = gem_scene.instantiate()
	gem_instance.position = Vector2(randf_range(-500, 500), 0)
	get_tree().get_first_node_in_group("gem_layer").add_child(gem_instance)
	gem_created_signal.emit(gem_instance)
