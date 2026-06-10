class_name CustomNightLoader
extends Control

@export var night_loader: NightLoader
@export var ai_selects: Array[AISelect]
@export var power_option: OptionButton
@export var temperature_option: OptionButton
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_custom_night() -> void:
	hide()
	night_loader.init_night(get_data())

func _on_start_button_pressed() -> void:
	start_custom_night()

func get_data() -> NightData:
	var ai_levels: Array[int] = []
	for a in ai_selects:
		ai_levels.append(a.ai_level)
	var power: int
	var temperature: float
	match power_option.selected:
		0:
			power = 0
		1:
			power = 6
		2:
			power = 5
		3:
			power = 4
		4:
			power = 3
		5:
			power = 2
		_:
			power = 0
	match temperature_option.selected:
		0:
			temperature = 0
		1:
			temperature = 0.25
		2:
			temperature = 0.5
		3:
			temperature = 1
		4:
			temperature = 1.5
		5:
			temperature = 2
		_:
			temperature = 0
	return NightData.new(ai_levels,power,temperature)


func _on_back_button_pressed() -> void:
	hide()
