extends Area2D




func _on_body_entered(body):
	if body.name == "player":
		GlobalVar.coin += 1
		queue_free()
		print(GlobalVar.coin)
