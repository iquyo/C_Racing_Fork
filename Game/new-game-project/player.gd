extends CharacterBody3D

var speed = 10.0

func _physics_process(delta):
	var input_dir = Vector3.ZERO

	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.z += 1
	if Input.is_action_pressed("ui_up"):
		input_dir.z -= 1


	input_dir = input_dir.normalized() * speed
	velocity.x = input_dir.x
	velocity.z = input_dir.z


	move_and_slide()
