@abstract
class_name Animatronic
extends Node
## Base animatronic class.

var progress: int = 0
var pos: int = 0

var timer: float = 0.0

var locked: bool = false

@export var stages: int = 0

@export_range(0,20) var ai_level: int = 0

## Time between movement opportunities.
@export var move_time: float = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset() # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree().get_first_node_in_group("Office").gameState != Constants.GameState.ACTIVE:
		pos = -1
		process_mode = Node.PROCESS_MODE_DISABLED
		return
	if progress == stages:
		return
	timer += delta
	while timer >= move_time:
		timer -= move_time
		if eval_movement_opportunity():
			progress += 1
			if progress == stages:
				complete_movement()

func eval_movement_opportunity() -> bool:
	if locked:
		return false
	var rand: int = randi_range(1,20)
	if rand <= ai_level:
		return true
	return false
	
@abstract func complete_movement() -> void

@abstract func reset() -> void
