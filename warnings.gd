extends Control

var warning_pos: int = 0
@export var warning_labels: Array[RichTextLabel]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()
	warning_pos = 0
	update_warnings()

func _process(_delta: float) -> void:
	if Input.is_action_just_released("ui_select") or Input.is_action_just_released("select"):
		warning_pos += 1
		update_warnings()
		
func update_warnings() -> void:
	if warning_pos >= len(warning_labels):
		hide()
		process_mode = Node.PROCESS_MODE_DISABLED
	else:
		for w in warning_labels:
			w.hide()
		warning_labels[warning_pos].show()


func _on_rich_text_label_2_meta_clicked(meta: Variant) -> void:
	OS.shell_open(str(meta))
	warning_pos -= 1
	pass # Replace with function body.
