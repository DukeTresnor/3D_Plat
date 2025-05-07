extends State

func enter(_msg := {}) -> void:
	#owner.velocity = Vector3.ZERO
	
	# When you enter idle, playe the idle animation using the state_machine's animated_sprite_2d
	#state_machine.animated_sprite_2d.play("idle")
	#state_machine.animated_mesh_3d.play("idle")
	print("Idle: Playing Idle animation")


func update(delta: float) -> void:
	# Assigning for easy reference
	# Reference for player position -- if needed
	#owner.player_pos = state_machine.animated_sprite_2d.global_position
	
	# is_on_floor() is not a valid function for 3D
	#   Replace with a different code logic to determine when to handle falling
	#if not owner.is_on_floor():
	#	state_machine.transition_to("Jump")
	#	return

	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Jump", {do_jump = true})

	# ----- Move Logic ----- #
	# Replace with a match statement when you figure it out...
	# Can this handle multiple directions???
	# Yes, if move can transition to move with a different message
	# These messages are dictionaries
	if Input.is_action_pressed("move_up"):
		state_machine.transition_to("Move", {move_type = "move_up"})
	if Input.is_action_pressed("move_down"):
		state_machine.transition_to("Move", {move_type = "move_down"})
	if Input.is_action_pressed("move_left"):
		state_machine.transition_to("Move", {move_type = "move_left"})
	if Input.is_action_pressed("move_right"):
		state_machine.transition_to("Move", {move_type = "move_right"})


	if Input.is_action_just_pressed("attack"):
		state_machine.transition_to("Attack")


func physics_update(delta: float) -> void:
	
	owner.velocity += owner.gravity * delta
	owner.move_and_slide()
	
