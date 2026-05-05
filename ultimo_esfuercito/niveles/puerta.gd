extends Area2D

const proxima_escena = preload("res://niveles/nivel_2.tscn") 
signal puerta_pisada(proxima_escena)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	puerta_pisada.emit(proxima_escena)
	pass # Replace with function body.
