extends Node

@export var ai_loader: AILoader
@export var office: Office

func load_data(data: NightData):
	ai_loader.init_ai_levels(data.ai_levels)
	office.powerDrainRate = data.power
	office.tempSpeed = data.temperature
