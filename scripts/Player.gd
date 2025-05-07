extends CharacterBody3D


const JUMP_FORCE = 10.0



@onready var gravity: Vector3 = ProjectSettings.get_setting("physics/3d/default_gravity") * \
							ProjectSettings.get_setting("physics/3d/default_gravity_vector")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#print("odvkjndfvkndfjkg")
	pass
