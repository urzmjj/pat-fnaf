class_name MainMenu
extends Node

@export var night_loader: NightLoader
@export var custom_night: CustomNightLoader
@export var night_database: NightDatabase
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_custom_night_button_pressed() -> void:
	custom_night.show()


func _on_quit_button_pressed() -> void:
	# get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()


func _on_new_game_button_pressed() -> void:
	night_loader.init_night(night_database.nights[0])


func _on_settings_button_pressed() -> void:
	pass # Replace with function body.
