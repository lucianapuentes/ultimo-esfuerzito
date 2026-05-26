extends CharacterBody2D

@export var speed = 100
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity = direction * speed
	move_and_slide()
	


func _on_timer_timeout() -> void:
	navigation_agent_2d.target_position=player.global_position
