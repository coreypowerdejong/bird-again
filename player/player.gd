extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

enum player_state {IDLE, WALK, JUMP}
var state: player_state = player_state.IDLE

func _ready():
	state = player_state.IDLE
	$AnimatedSprite2D.play("default")
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		$AnimatedSprite2D.play("jumping")
	else:
		state = player_state.IDLE
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		state = player_state.JUMP

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if state == player_state.IDLE or state == player_state.WALK:
			$AnimatedSprite2D.play("walking")
			state = player_state.WALK
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if state == player_state.JUMP:
			$AnimatedSprite2D.play("jumping")
		else:
			$AnimatedSprite2D.play("default")

	move_and_slide()
