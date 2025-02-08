extends StaticBody3D

var original_rotation: Vector3
var shouldReturn = false

var rotationSpeed = 2.5
var returnSpeed = 5.0


func _ready() -> void:
	original_rotation = rotation

func _process(delta: float) -> void:
	shouldReturn = true 

	if Input.is_action_pressed("up"):
		rotation.x += rotationSpeed * delta
		shouldReturn = false
	
	if Input.is_action_pressed("down"):
		rotation.x -= rotationSpeed * delta
		shouldReturn = false

	if Input.is_action_pressed("left"):
		rotation.z += rotationSpeed * delta
		shouldReturn = false

	if Input.is_action_pressed("right"):
		rotation.z -= rotationSpeed * delta
		shouldReturn = false

	if shouldReturn:
		rotation = lerp(rotation, original_rotation, returnSpeed * delta)
