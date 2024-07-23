extends Timer

func _on_timeout():
	get_tree().reload_current_scene()
