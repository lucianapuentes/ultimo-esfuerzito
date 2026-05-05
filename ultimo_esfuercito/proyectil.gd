# Proyectil.gd
extends CharacterBody2D

var velocidad := 300.0
var direccion := Vector2.RIGHT
var numero := 0

func _ready():
	$Sprite2D.texture = load("res://numSprites/Number" + str(numero) + " 7x10.png")
	
	# Ignorar colisión con el personaje que disparó
	call_deferred("_ignorar_padre")
	
	await get_tree().create_timer(3.0).timeout
	queue_free()

func _ignorar_padre():
	var padre = get_parent()
	# Busca el CharacterBody2D del personaje y lo ignora
	for nodo in get_tree().get_nodes_in_group("jugador"):
		add_collision_exception_with(nodo)

func _physics_process(delta):
	velocity = direccion * velocidad
	var colision = move_and_collide(velocity * delta)
	if colision:
		var golpeado = colision.get_collider()
		if golpeado.has_method("recibir_danio"):
			golpeado.recibir_danio(numero)
		queue_free()
