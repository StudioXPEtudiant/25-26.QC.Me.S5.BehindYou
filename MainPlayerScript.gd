extends CharacterBody3D

@export var gravity:=150

@export var jump_velocity:=70

@export var speed:float

@export var sensibilite:float

var direction = Vector3.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta):
	direction=Vector3.ZERO
	if Input.is_action_pressed("J1_Left"):
		direction += global_transform.basis.x 
	if Input.is_action_pressed("J1_Right"):
		direction -= global_transform.basis.x 
	if Input.is_action_pressed("J1_Down"):
		direction -= global_transform.basis.z 
	if Input.is_action_pressed("J1_Up"):
		direction += global_transform.basis.z
	direction.y=0
	direction=direction.normalized()
	velocity.y=direction.y*speed
	velocity.x=direction.x*speed
	velocity.z=direction.z*speed 
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = jump_velocity
	#if not is_on_floor():
		#velocity.y -= 9* _delta


	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y-=event.relative.x*(sensibilite/500)
		rotation.x+=event.relative.y*(sensibilite/500)
