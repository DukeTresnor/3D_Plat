extends State

# This might not be necessary


# Virtual function. Receives events from the
#  `_unhandled_input()` callback.
# _unhandled_input() is a func in the state
#   machine script
func handle_input(_event: InputEvent) -> void:
	pass

# Virtual function. Corresponts to the _process()
#   callback within the state machine script
func update(_delta: float) -> void:
	pass
	
# Virtual function. Corresponds to the
#   `_physics_process()` callback in the
#   state machine script
func physics_update(_delta: float) -> void:
	pass

# Virtual function. Called by the state machine upon changing the active state. The `msg` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
#   the functions that extend this need to have some sort of constructions?
func enter(_msg := {}) -> void:
	pass

# Virtual function. Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> void:
	pass
