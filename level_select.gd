extends Node2D

func _on_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
	MapData.selected_map = "earth"

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://moon.tscn")
	MapData.selected_map = "moon"
