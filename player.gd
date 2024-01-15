extends CharacterBody2D

@onready var player_spr = $AnimatedSprite2D

const SPEED = 400.0
const JUMP_VELOCITY = -950.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if (velocity.x > 1 || velocity.x < -1):
		player_spr.animation = "run"
	else:
		player_spr.animation = "default"

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		player_spr.animation = "jump"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if velocity.x != 0:
		var isLeft = velocity.x < 0
		player_spr.flip_h = isLeft
	
		
