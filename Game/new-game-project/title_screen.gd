extends Control


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")
	pass # Replace with function body.


func _on_controls_button_pressed() -> void:
	get_tree().change_scene_to_file("res://control.tscn")
	pass # Replace with function body.
