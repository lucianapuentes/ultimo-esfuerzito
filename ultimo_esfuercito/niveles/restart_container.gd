extends VBoxContainer

func _on_prota_player_died() -> void:
	show()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://qltwck1lp7j6")
