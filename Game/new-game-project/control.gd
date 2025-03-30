extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://title_screen.tscn")


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://title_screen.tscn")
