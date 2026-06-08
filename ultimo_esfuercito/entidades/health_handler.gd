class_name HealthHandler
extends Node

signal entity_died
signal damage_taken(dmg)
signal health_restored(dmg)

@export var max_hp = 100

var current_health:
	set(value):
		current_health = value
		print(current_health)
		if current_health <= 0:
			entity_died.emit()

func _ready() -> void:
	current_health = max_hp


func take_damage(dam:float)->void:
	current_health=current_health-dam
	damage_taken.emit(current_health)

func restore_health(heal:float)->void:
	if(current_health+heal>max_hp):
		current_health=max_hp
	else:
		current_health=current_health+heal
	health_restored.emit(current_health)
