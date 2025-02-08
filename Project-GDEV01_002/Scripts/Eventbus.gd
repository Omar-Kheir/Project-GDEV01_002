extends Node

signal gameOver

func _ready() -> void:
	gameOver.connect(endRun)
	
func endRun():
	get_tree().change_scene_to_file.bind("res://Scenes/EndRunMenu.tscn").call_deferred()
	PlayerStats.reset()
