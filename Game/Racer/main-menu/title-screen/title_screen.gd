extends Control


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main-menu/player-selection/player_selection.tscn")


func _on_controls_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main-menu/controls/control.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main-menu/credits/credits.tscn")
