class_name NightData

var ai_levels: Array[int]
var power: int
var temperature: float

func _init(ai_levels: Array[int], power: int, temperature: float) -> void:
	self.ai_levels = ai_levels
	self.power = power
	self.temperature = temperature
