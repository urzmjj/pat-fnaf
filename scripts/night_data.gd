class_name NightData
extends Resource

@export var ai_levels: Array[AILevelDynamic] = []
@export var power: int = 4
@export var temperature: float = 1.0


static func from_data(ai_levels: Array[AILevelDynamic] = [], power: int = 4, temperature: float = 1.0) -> NightData:
	var night_data = new()
	night_data.ai_levels = ai_levels
	night_data.power = power
	night_data.temperature = temperature
	return night_data
