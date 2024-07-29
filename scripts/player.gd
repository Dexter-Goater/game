extends CharacterBody2D

const dash_speed = 200
const SPEED = 100.0
const JUMP_VELOCITY = -150
var dashing = false
var can_dash = true
@onready var gravity = MapData.set_gravity()
# Get the gravity from the project settings to be synced with RigidBody nodes.
var coyote_time = 0.2
var can_jump = false

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var start_position = Vector2(50,80)

func _physics_process(delta):
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if abs(velocity.x) > 1:
			anim.play("run")
		else :
			anim.play("idle")
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false

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


func _on_area_2d_body_entered(body):
	get_tree().reload_current_scene()

func _on_dash_timer_timeout():
	dashing = false

func _on_dash_cooldown_timeout():
	can_dash = true

func _on_coyote_timer_timeout():
	can_jump = false 
