extends Node2D
const bullet_scene: PackedScene = preload("res://Scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$shop/shop_UI.visible = false
	GlobalVar.ammo = 1 * GlobalVar.gun_lvl


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass








func _on_shop_body_entered(body):
	if body.name == "Player":
		$shop/shop_UI.visible = true


func _on_shop_body_exited(body):
		if body.name == "Player":
			$shop/shop_UI.visible = false


func _on_player_shoot(pos, facing_right):
	var bullet = bullet_scene.instantiate()
	var direction = 1 if facing_right else -1
	$bullets.add_child(bullet)
	bullet.position = pos
	bullet.direction = direction
