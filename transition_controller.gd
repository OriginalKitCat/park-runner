class_name SceneTransitionController extends Control

@onready var background = $ColorRect
@onready var animation_player = $AnimationPlayer

func transition(animation: String, seconds: float):
	animation_player.play(animation, 0, 1 / seconds)
