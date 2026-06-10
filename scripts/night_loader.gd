class_name NightLoader
extends Node

@export var main_menu: MainMenu
var current_game = null
var game_scene = preload("res://game.tscn")

func init_night(data: NightData) -> void:
	if is_instance_valid(current_game): 
		push_error("Game already exists, doofus")
		return 
	current_game = game_scene.instantiate()
	current_game.load_data(data)
	add_child(current_game)
	main_menu.hide()

func return_to_menu():
	current_game.queue_free()
	main_menu.show()
