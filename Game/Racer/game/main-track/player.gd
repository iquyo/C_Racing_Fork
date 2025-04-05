extends CharacterBody3D

const SPEED = 60
const JUMP_VELOCITY = 4.5
const SENSITIVITY = 0.05

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 20

# shortcuts to the child nodes
@onready var camera = $Camera3D



func _physics_process(delta):
	var input_vector = Vector3.ZERO
	if not is_on_floor():
		input_vector.y -= gravity * delta
	if Input.is_action_pressed("ui_right"):
		rotate_y(-1 * SENSITIVITY)
	if Input.is_action_pressed("ui_left"):
		rotate_y(1 * SENSITIVITY)
	if Input.is_action_pressed("ui_down"):
		input_vector.z += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.z -= 1
		
	# Jumping physics	
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	input_vector = (transform.basis * input_vector).normalized()
	velocity = input_vector * SPEED
	move_and_slide()
