extends Node2D

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	MapData.selected_map = "earth"

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/moon.tscn")
	MapData.selected_map = "moon"


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/mars.tscn")
	MapData.selected_map = "mars"


