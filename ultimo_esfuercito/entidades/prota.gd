extends CharacterBody2D

@onready var anim_tree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")
const SPEED = 150.0



func _physics_process(delta: float) -> void:

	var direction = Input.get_vector("izquierda", "derecha", "arriba", "abajo", -1.0)
	if direction:
		velocity = direction * SPEED
		anim_tree.set("parameters/Walk/blend_position", direction)
		anim_tree.set("parameters/Idle/blend_position", direction)
		# Le decimos a la máquina de estados que se mueva a "Walk"
		anim_state.travel("Walk")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		anim_state.travel("Idle")
	move_and_slide()
	
func take_damage(damage: int) -> void:
	print("me dolio una banda")
	pass
