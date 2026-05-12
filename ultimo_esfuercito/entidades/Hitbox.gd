class_name Hitbox
extends Area2D

@export var damage := 10
@export_enum("jugador", "enemigo") var propietario : String = "jugador"

func _init() -> void:
	collision_layer = 2
	collision_mask = 0
