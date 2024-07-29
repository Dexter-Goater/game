extends Node2D
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D

@export var speed = 50 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow.progress += speed * delta 


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
