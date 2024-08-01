extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$shop/shop_UI.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shop_body_entered(body):
	if body.name == "Player":
		$shop/shop_UI.visible = true
		print("hello")


func _on_shop_body_exited(body):
	if body.name == "Player":
		$shop/shop_UI.visible = false
