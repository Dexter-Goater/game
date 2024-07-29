extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		GlobalVar.coin += 1
		queue_free()
		print(GlobalVar.coin)
