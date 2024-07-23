extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play('cutscene_1')


	


func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://level_select.tscn")
