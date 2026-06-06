extends CharacterBody2D

signal lower_health(value : float)
signal gain_health(value : float)

@onready var anim_tree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")

const SPEED = 150.0
const Proyectil = preload("res://entidades/proyectil.tscn")  # ajustá la ruta

var ultima_direccion := Vector2.RIGHT 


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("izquierda", "derecha", "arriba", "abajo", -1.0)
	if direction:
		velocity = direction * SPEED
		ultima_direccion = direction
		anim_tree.set("parameters/Walk/blend_position", direction)
		anim_tree.set("parameters/Idle/blend_position", direction)
		anim_state.travel("Walk")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		anim_state.travel("Idle")
	move_and_slide()
	if Input.is_action_just_pressed("ataque"):
		disparar()





func disparar() -> void:
	var bala = Proyectil.instantiate()
	bala.direccion = ultima_direccion.normalized()
	bala.numero = randi() % 10
	# Offset para que no spawne dentro del personaje
	bala.global_position = global_position + ultima_direccion.normalized() * 20
	get_tree().root.add_child(bala)


func _ready() -> void:
	add_to_group("jugador")  # ← esto


func _on_health_handler_entity_died() -> void:
	pass # Replace with function body.


func _on_health_handler_damage_taken(current_health:float) -> void:
	lower_health.emit(current_health)


func _on_health_handler_health_restored(current_health: float) -> void:
	gain_health.emit(current_health)
