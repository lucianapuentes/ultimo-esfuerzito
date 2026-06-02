class_name HurtBox
extends Area2D
signal entity_hit(damage: float)
@export_enum("jugador", "enemigo") var propietario : String = "jugador"

func _init() -> void:
	collision_layer = 0
	collision_mask = 2
	
func _ready() -> void:
	connect("area_entered", _on_area_entered)

func _on_area_entered(hitbox: Hitbox) -> void:
	if hitbox == null or propietario == hitbox.propietario:
		return
		
	entity_hit.emit(hitbox.damage)
	
