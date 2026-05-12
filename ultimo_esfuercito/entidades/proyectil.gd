# Proyectil.gd
extends CharacterBody2D

var velocidad := 300.0
var direccion := Vector2.RIGHT
var numero := 0

func _ready():
	$Sprite2D.texture = load("res://numSprites/Number" + str(numero) + " 7x10.png")
	
	await get_tree().create_timer(3.0).timeout
	queue_free()


func _physics_process(delta):
	velocity = direccion * velocidad
	move_and_slide()
