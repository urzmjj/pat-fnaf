class_name AILevelDynamic
extends Resource
@export var starting_level: int = 0
@export var level_changes: Dictionary[int, int] = {}


func _init(starting_level: int = 0, level_changes: Dictionary[int, int] = {}) -> void:
	self.starting_level = starting_level
	self.level_changes = level_changes
