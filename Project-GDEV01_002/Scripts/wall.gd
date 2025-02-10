extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		$"../GPUParticles3D".global_transform.origin = body.global_transform.origin
		Eventbus.wallHit.emit()
		$"../GPUParticles3D".emitting = true
