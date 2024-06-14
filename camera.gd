extends Camera2D

@export var player : Node2D
var max_x = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	max_x = player.position.x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.position.x > max_x:
		max_x = player.position.x
	position.x = max_x
	
	
