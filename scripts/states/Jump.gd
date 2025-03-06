extends State

func enter(_msg := {}) -> void:
	if _msg.has("do_jump"):
		print("Jump: entering jump; adjust velocity upward")
	else:
		print("Jump: entering jump from falling")
	# When you enter idle, playe the idle animation using the state_machine's animated_sprite_2d
	#state_machine.animated_sprite_2d.play("idle")
	#state_machine.animated_mesh_3d.play("idle")

func update(delta: float) -> void:
	# Assigning for easy reference
	# Reference for player position -- if needed
	#owner.player_pos = state_machine.animated_sprite_2d.global_position

	# If we land, transition back to idle
	if owner.is_on_floor():
		if is_equal_approx(owner.velocity.x, 0.0) || is_equal_approx(owner.velocity.z, 0.0):
			state_machine.transition_to("Idle")
		else:
			# Need to include logic for jumping in any direction
			state_machine.transition_to("Move")		


	if Input.is_action_just_pressed("attack"):
		state_machine.transition_to("Attack")
