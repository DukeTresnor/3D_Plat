extends State

var movement_vector: Vector3

func enter(_msg := {}) -> void:
	
	# Pretty clunky, this takes the _msg input which is a dictionary,
	#   extracts its values from the key: value pairs, then extracts
	#   the first of those values (this should be the only value in the
	#   _msg dictionary
	match str(_msg.values()[0]):
		"move_up":
			print("Move: move_up")
			movement_vector = Vector3.FORWARD
		"move_down":
			print("Move: move_down")
			movement_vector = Vector3.BACK
		"move_left":
			print("Move: move_left")
			movement_vector = Vector3.LEFT
		"move_right":
			print("Move: move_right")
			movement_vector = Vector3.RIGHT
	
	#pass
	
	# When you enter move, playe the move animation using the state_machine's 3d mesh?
	#state_machine.animated_sprite_2d.play("idle")
	#state_machine.animated_mesh_3d.play("idle")

func update(delta: float) -> void:
	# Assigning for easy reference
	# Reference for player position -- if needed
	#owner.player_pos = state_machine.animated_sprite_2d.global_position
	
	owner.apply_central_force(movement_vector * 1200.0 * delta)
	
	# After a force is applied to the player, reset movement_vector to let the
	#   player slow down
	# Something is needed b/c current state machine implementation means that
	#   the four movement actions trigger a transition to the Move state, which in
	#   turn does control movement based on what was pressed to enter that instance of
	#   the Move state. However, I seem to lost the ability to retain a force that degrades
	#   over time...
	# A fix was to make movement occur from holding the button press with is_action_pressed()
	#   not sure if this works, Damp effect from inspector is unknown...
	#movement_vector = Vector3.ZERO
	print("Move: movement_vector: " + str(movement_vector))
	movement_vector *= 0.9
	
	# Replace with 3D logic for detecting transition to falling state
	#if not owner.is_on_floor():
	#	state_machine.transition_to("Jump")
	#	return

	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Jump", {do_jump = true})

	

	# ----- Move Logic ----- #
	# Replace with a match statement when you figure it out...
	# Can this handle multiple directions???
	# Yes, if move can transition to move with a different message
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
