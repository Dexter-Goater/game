extends Node
var selected_map : String
var map_gravity : int

func set_gravity():
	match selected_map:
		"earth":
			map_gravity = 500
		"moon":
			map_gravity = 300
		"mars":
			map_gravity = 400
		"boss":
			map_gravity = 300
	return map_gravity
