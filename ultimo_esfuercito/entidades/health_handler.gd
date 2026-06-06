class_name HealthHandler
extends Node

signal entity_died
signal damage_taken
signal health_restored

const MAX_HP = 100

var current_health = 100


func take_damage(dam:float)->void:
	current_health=current_health-dam
	print("recibi daño", dam)
	damage_taken.emit(current_health)

func restore_health(heal:float)->void:
	if(current_health+heal>MAX_HP):
		current_health=MAX_HP
	else:
		current_health=current_health+heal
	health_restored.emit(current_health)
