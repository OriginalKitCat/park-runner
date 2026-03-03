extends Area2D

@onready var player
@onready var checkpoint_manager

var timer : Timer;
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Data.was_killed = true
		Data.lives_data -= 1
	
