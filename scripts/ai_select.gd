@tool
class_name AISelect
extends AspectRatioContainer

var ai_level: int = 0
@onready var animatronic_name: String = name
@onready var ai_level_label: Label = get_node("VBoxContainer/HBoxContainer/AI Level")
@onready var name_label: Label = get_node("VBoxContainer/Name")
@onready var pic: TextureRect = get_node("VBoxContainer/Pic")
@onready var up_button: BaseButton = get_node("VBoxContainer/HBoxContainer/Up")
@onready var down_button: BaseButton = get_node("VBoxContainer/HBoxContainer/Down")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not Engine.is_editor_hint():
		up_button.pressed.connect(_on_up_pressed)
		down_button.pressed.connect(_on_down_pressed)
		name_label.text = animatronic_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		if is_inside_tree():
			get_node("VBoxContainer/Name").text = name
	else:
		ai_level_label.text = "%d"%ai_level
		up_button.disabled = ai_level >= 20
		down_button.disabled = ai_level <= 0

func _on_up_pressed() -> void:
	if not Engine.is_editor_hint():
		ai_level = min(ai_level+1, 20)

func _on_down_pressed() -> void:
	if not Engine.is_editor_hint():
		ai_level = max(ai_level-1, 0)
