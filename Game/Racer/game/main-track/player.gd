extends CharacterBody3D

const SPEED = 60
const JUMP_VELOCITY = 4.5
const SENSITIVITY = 0.05

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 9.8

# shortcuts to the child nodes
@onready var camera = $Camera3D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	if Input.is_action_pressed("ui_right"):
		rotate_y(-1 * SENSITIVITY)  # Rotate player right
	if Input.is_action_pressed("ui_left"):
		rotate_y(1 * SENSITIVITY)  # Rotate player left
	
	var move = 0

	if Input.is_action_pressed("ui_up"):
		move = -1
	if Input.is_action_pressed("ui_down"):
		move = 1
	
	var direction = (transform.basis * Vector3(0, 0, move)).normalized()

	if direction:
		velocity.z = direction.z * SPEED
	else:
		velocity.z = 0.0

	move_and_slide() # Changes the character depending on the velocity vector
