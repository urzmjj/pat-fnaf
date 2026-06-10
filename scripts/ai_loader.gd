class_name AILoader
extends Node

@export var animatronics: Array[Animatronic]
@export var ai_levels: Array[AILevelDynamic]

func init_ai_levels(ai_levels: Array[AILevelDynamic] = ai_levels):
	self.ai_levels = ai_levels
	for i in range(len(self.ai_levels)):
		if is_instance_valid(animatronics[i]):
			if is_instance_valid(self.ai_levels[i]):
				animatronics[i].ai_level = self.ai_levels[i].starting_level
			else:
				animatronics[i].ai_level = 0
			
func update_ai_levels(time: int):
	for i in range(len(ai_levels)):
		if not is_instance_valid(ai_levels[i]):
			continue
		if time not in ai_levels[i].level_changes:
			continue
		if is_instance_valid(animatronics[i]):
			animatronics[i].ai_level += ai_levels[i].level_changes[time]
