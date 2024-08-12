extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalVar.O2_lvl == 1:
		play("Lvl 1")
	elif GlobalVar.O2_lvl == 2:
		play("Lvl 2")
	else:
		play("Lvl 3")




func _on_animation_finished():
	get_tree().reload_current_scene()
