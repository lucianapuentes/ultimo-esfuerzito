extends CharacterBody2D

@onready var anim_tree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")
const SPEED = 150.0
const Proyectil = preload("res://entidades/proyectil.tscn")  # ajustá la ruta
var ultima_direccion := Vector2.RIGHT 
@export var contenedor_balas: Node  
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

	# Disparo acá, no en _input
	if Input.is_action_just_pressed("ataque"):
		disparar()
func take_damage(damage: int) -> void:
	print("me dolio una banda")
	pass
func disparar() -> void:
	if contenedor_balas == null:
		print("ERROR: contenedor_balas no asignado en el Inspector")
		return
	var bala = Proyectil.instantiate()
	bala.direccion = ultima_direccion.normalized()
	bala.numero = randi() % 10
	# Offset para que no spawne dentro del personaje
	bala.global_position = global_position + ultima_direccion.normalized() * 20
	contenedor_balas.add_child(bala)
func _ready() -> void:
	add_to_group("jugador")  # ← esto
