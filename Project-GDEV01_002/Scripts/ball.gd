extends RigidBody3D

var fell = false
var originalPos:Vector3

func _ready() -> void:
	updateHUD()
	originalPos = position
	Eventbus.wallHit.connect(die)
	$GPUParticles3D.emitting = true

func _process(_delta: float) -> void:
	if position.y < -5 && !fell:
		fell = true
		die()
	
	$CanvasLayer/Control/Label2.text = str(Engine.get_frames_per_second())

func die():
	if PlayerStats.lives > 1:
		PlayerStats.lives -= 1
		respawn()
		updateHUD()
	else:
		PlayerStats.lives -= 1
		updateHUD()
		Eventbus.gameOver.emit()

func respawn():
	position = originalPos
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
	$GPUParticles3D.emitting = true
	fell = false

func updateHUD():
	$CanvasLayer/Control/Label.text = "Lives: " + str(PlayerStats.lives)
