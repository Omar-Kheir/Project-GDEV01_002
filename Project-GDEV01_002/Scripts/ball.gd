extends RigidBody3D

var fell = false
var originalPos:Vector3

func _ready() -> void:
	updateHUD()
	originalPos = position
	Eventbus.wallHit.connect(die)

func _process(_delta: float) -> void:
	if position.y < -5 && !fell:
		fell = true
		die()

func die():
	if PlayerStats.lives > 1: #Respawn
		PlayerStats.lives -= 1
		respawn()
		updateHUD()
	else: #Gameover
		PlayerStats.lives -= 1
		updateHUD()
		$BallMesh.set_visible(false)
		$GameOverTimer.start()
		

func respawn():
	$BallMesh.set_visible(false)
	$RespawnTimer.start()
	
func _on_timer_timeout() -> void:
	$BallMesh.set_visible(true)
	position = originalPos
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
	$GPUParticles3D.emitting = true
	fell = false

func _on_game_over_timer_timeout() -> void:
	Eventbus.gameOver.emit()

func updateHUD():
	$CanvasLayer/Control/Label.text = "Lives: " + str(PlayerStats.lives)
