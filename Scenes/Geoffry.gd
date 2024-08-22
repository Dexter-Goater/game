extends Node2D
@export var shoot_cooldown = 1

@onready var Greenshoot_timer = $"../Green_attack"

var GreenBulletScene = load("res://Scenes/green_projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Greenshoot_timer.start(shoot_cooldown)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Greenshoot_timer.is_stopped():
		shoot()
		Greenshoot_timer.start(shoot_cooldown)

func shoot():
	var bullet = GreenBulletScene.instantiate
	add_child(bullet)
	bullet.direction = global_position.direction_to($"../Player".global_position)
	bullet.global_position = global_position

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()

