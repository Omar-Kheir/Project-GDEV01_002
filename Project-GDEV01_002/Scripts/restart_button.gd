extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file.bind("res://Scenes/MainMenu.tscn").call_deferred()
