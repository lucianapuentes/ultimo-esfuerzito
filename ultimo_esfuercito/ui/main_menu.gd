extends Control

const NIVEL_1 = preload("uid://bef0iv1p42n7")

func _on_button_button_down() -> void:
	get_tree().change_scene_to_packed(NIVEL_1)
