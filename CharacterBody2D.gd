extends CharacterBody2D
# Variables for movement
var speed = 200
var gravity = 400
var jump_strength = -300

# Jetpack variables
var jetpack_enabled = false
var jetpack_fuel = 100
var jetpack_fuel_consumption = 10
var jetpack_boost_strength = -200
var jetpack_recharge_rate = 5
var is_recharging_fuel = false

# Input actions
const INPUT_JETPACK = "ui_accept" # Change this to your desired input

func _ready():
	pass

func _physics_process(delta):
	# Handle movement
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	
	velocity.x = direction.x * speed
	
	# Apply gravity
	velocity.y += gravity * delta
	
	# Handle jetpack
	if Input.is_action_pressed(INPUT_JETPACK) and jetpack_fuel > 0:
		jetpack_enabled = true
	else:
		jetpack_enabled = false

	if jetpack_enabled:
		if not is_recharging_fuel:
			jetpack_fuel -= jetpack_fuel_consumption * delta
			if jetpack_fuel < 0:
				jetpack_fuel = 0
				jetpack_enabled = false
	else:
		if jetpack_fuel < 100:
			jetpack_fuel += jetpack_recharge_rate * delta
			if jetpack_fuel > 100:
				jetpack_fuel = 100

	if jetpack_enabled:
		velocity.y += jetpack_boost_strength * delta

	# Move the player
   
