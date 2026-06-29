extends Control

var warning_pos: int = 0
@export var warning_labels: Array[RichTextLabel]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_warnings()

func _on_gui_input(event: InputEvent) -> void:
	if(event.is_action_pressed("select")):
		get_viewport().set_input_as_handled()
		warning_pos += 1
		update_warnings()
		
func update_warnings() -> void:
	if warning_pos >= len(warning_labels):
		hide()
	else:
		for w in warning_labels:
			w.hide()
		warning_labels[warning_pos].show()
