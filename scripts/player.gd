extends CharacterBody2D
var fuel = 100 * GlobalVar.jetpack_lvl
var jetpack_speed = -50
const dash_speed = 200
const SPEED = 100.0
const JUMP_VELOCITY = -150
var dashing = false
var can_dash = true
@onready var gravity = MapData.set_gravity()
# Get the gravity from the project settings to be synced with RigidBody nodes.
var coyote_time = 0.2
var can_jump = false
signal shoot(pos: Vector2, direction: bool)
var facing_right = true
var shooting = false

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var start_position = Vector2(50,80)

func _physics_process(delta):
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if abs(velocity.x) > 1 and shooting == false:
			anim.play("run")
		elif shooting == false:
			anim.play("idle")
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		facing_right = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		facing_right = true

	if is_on_floor() and can_jump == false:
		can_jump = true 
		
	elif can_jump == true and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start(coyote_time)
	# Handle jump.
	if can_jump:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		$dash_cooldown.start()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if dashing:
			velocity.x = direction * dash_speed
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if position.y > 120 :
		get_tree().reload_current_scene()
	
	if Input.is_action_pressed("E") and fuel > 1:
		velocity.y = jetpack_speed
		fuel -= 5
		anim.play("jetpack")
	
	if is_on_floor():
		if not fuel == 100:
			fuel = 100 * GlobalVar.jetpack_lvl
	
	if Input.is_action_just_pressed("shoot") and GlobalVar.ammo > 0:
		shoot.emit(global_position, facing_right)
		anim.play("shoot")
		$shootinganim_timer.start()
		shooting = true
		GlobalVar.ammo -= 1
		
	

func _on_area_2d_body_entered(body):
	get_tree().reload_current_scene()

func _on_dash_timer_timeout():
	dashing = false

func _on_dash_cooldown_timeout():
	can_dash = true

func _on_coyote_timer_timeout():
	can_jump = false 





func _on_shootinganim_timer_timeout():
	shooting = false
