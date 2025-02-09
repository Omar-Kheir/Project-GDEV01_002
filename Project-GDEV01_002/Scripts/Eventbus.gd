extends Node

signal gameOver
signal wallHit
signal levelPassed

var levels = ["res://Scenes/level_1.tscn", 
			"res://Scenes/level_2.tscn",
			"res://Scenes/level_3.tscn"]
var currentLevel = 0

func _ready() -> void:
	gameOver.connect(endRun)
	levelPassed.connect(nextLevel)
	
func endRun():
	get_tree().change_scene_to_file.bind("res://Scenes/EndRunMenu.tscn").call_deferred()
	PlayerStats.reset()
	currentLevel = 0

func nextLevel():
	if currentLevel != 2:
		currentLevel += 1
		get_tree().change_scene_to_file.bind(levels[currentLevel]).call_deferred()
	else:
		get_tree().change_scene_to_file.bind("res://Scenes/MainMenu.tscn").call_deferred()
