extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _pĥysics_process(_delta):
	pass

var direction = Vector3.ZERO

if Input.is_action_pressed("J1_right"):
		direction.x += 1
if Input.is_action_pressed("J1_Left"):
		direction.x -= 1
if Input.is_action_pressed("J1_Down"):
		direction.z -= 1
if Input.is_action_pressed("J1_Up"):
		direction.z += 1
