extends Node2D
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D

@export var speed = 50 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow.progress += speed * delta 


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()





func _on_enemy_area_entered(area):
	if area.name == ("bullet") or area.name == ("@Area2D@2") or area.name == ("@Area2D@3"):
		queue_free()
