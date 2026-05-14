extends CharacterBody3D

@export var speed:float

@export var sensibilite:float

var direction = Vector3.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(_delta):
	direction=Vector3.ZERO
	if Input.is_action_pressed("J1_Left"):
		direction += transform.basis.x 
	if Input.is_action_pressed("J1_Right"):
		direction -= transform.basis.x 
	if Input.is_action_pressed("J1_Down"):
		direction -= transform.basis.z 
	if Input.is_action_pressed("J1_Up"):
		direction += transform.basis.z
	direction=direction.normalized()
	velocity.x=direction.x*speed
	velocity.z=direction.z*speed
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y-=event.relative.x*(sensibilite/500)
		rotation.x+=event.relative.y*(sensibilite/500)
