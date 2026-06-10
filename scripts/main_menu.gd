class_name MainMenu
extends Node

@export var CustomNight: CustomNightLoader
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_custom_night_button_pressed() -> void:
	CustomNight.show()
