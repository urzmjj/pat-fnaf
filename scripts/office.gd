class_name Office
extends Node

var power: int
var temperature: float
var time: float
@export var label: RichTextLabel
@export var time_label: RichTextLabel
@export var powerDrainRate: int
@export var tempSpeed: float
var gameState: Constants.GameState
var powerConsumption: int = 0
var drainTimer: float = 0
var passiveDrainCounter: int = 0
@export var powerOn: Array[Node3D]
@export var powerOff: Array[Node3D]
@export var doorHandler: DoorHandler
@export var cameraHandler: CameraHandler
@export var tempSwitch: TempSwitch

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	power = 1000
	temperature = 0
	powerConsumption = 1
	drainTimer = 0
	passiveDrainCounter = 0
	gameState = Constants.GameState.ACTIVE
	for i in range(len(powerOn)):
		powerOn[i].visible = true
	for i in range(len(powerOff)):
		powerOff[i].visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	match gameState:
		Constants.GameState.ACTIVE:
			powerConsumption = doorHandler.powerConsumption() + (1 if cameraHandler.camera_visible else 0) + (2 if get_tree().get_first_node_in_group("IcelyToad").progress == get_tree().get_first_node_in_group("IcelyToad").stages else 0) 
			label.text = "Power left: %s\nUsage: %s\nTemperature: %s" % [power_f(), usage_f(), temp_f()]
			time_label.text = time_f()
			drainTimer += delta
			temperature +=(1 if tempSwitch.flipped else -1) * tempSpeed * delta
			while drainTimer > 1:
				drainTimer -= 1
				if not (powerDrainRate == 0):
					power -= powerConsumption
					if powerDrainRate > 0:
						passiveDrainCounter += 1
						while passiveDrainCounter >= powerDrainRate:
							passiveDrainCounter -= powerDrainRate
							power -= 1
			if power <= 0:
				powerConsumption = 0
				label.text = ""
				time_label.text = ""
				for i in range(len(powerOn)):
					powerOn[i].visible = false
				for i in range(len(powerOff)):
					powerOff[i].visible = true
				gameState = Constants.GameState.POWER_OUT
		_:
			pass
	
func power_f() -> String:
	return "%d%%" % ceili(power/10.0)
	
func usage_f() -> String:
	var s = ""
	s += "[color=#00ff00]█[/color]"
	if powerConsumption >= 1:
		s += "[color=#80ff00]█[/color]"
	if powerConsumption >= 2:
		s += "[color=#ffff00]█[/color]"
	if powerConsumption >= 3:
		s += "[color=#ff8000]█[/color]"
		if powerConsumption >= 4:
			for i in range(powerConsumption-3):
				s += "[color=#ff0000]█[/color]"
	return s
	
func temp_f() -> String:
	return "%.1f°C" % snappedf(temperature + 20, 0.5)
	
func time_f() -> String:
	return "%d AM" % ((floori(time/90.0) + 11) % 12 + 1)
	
func power_fr() -> String:
	return "%f%%" % (power/10.0)
	
func temp_fr() -> String:
	return "%f°C" % (temperature + 20)
	
func time_fr() -> String:
	return "%02d:%02d:%02d.%03d" % [((floori(time/90.0) - 1) % 12 + 1),floori((fmod(time*2/3.0,60))),floori((fmod(time*40,60))),floori((fmod(time*40000,1000)))]
	
