extends Node2D


func _on_puerta_puerta_pisada(proxima_escena: Variant) -> void:
	get_tree().call_deferred("change_scene_to_packed",proxima_escena)
