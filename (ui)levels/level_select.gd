extends Node2D

var version = Data.version
@onready var player = $player
var currentlevel = 1
var load_this_level
var coins = Data.coins_data

func _ready() -> void:
	$Control/version.text = version
	$Control/coin_panal/Label.text = str(coins)
	$TransitionController.animation_player.play("Fade in")
	

func _on_play_button_button_down() -> void:
	#var current_Scene_file = get_tree().current_scene.scene_file_path
	#print(current_Scene_file)
	Data.lives_data = 3
	var next_scene = "res://(ui)levels/level0.tscn"
	get_tree().change_scene_to_file(next_scene)

func _on_select_level_button_button_down() -> void:
	Data.lives_data = 3
	var next_scene = "res://(ui)levels/level1.tscn"
	get_tree().change_scene_to_file(next_scene)


func _on_change_caracter_button_down() -> void:
	Data.lives_data = 3
	var next_scene = "res://(ui)levels/level2.tscn"
	$TransitionController.animation_player.play("Fade out")
	$TransitionController.transition("Fade out", 1)
	await  $TransitionController.animation_player.animation_finished
	get_tree().change_scene_to_file(next_scene)

func _on_level_3_button_down() -> void:
	Data.lives_data = 3
	var next_scene = "res://(ui)levels/level3.tscn"
	$TransitionController.animation_player.play("Fade out")
	$TransitionController.transition("Fade out", 1)
	await  $TransitionController.animation_player.animation_finished
	get_tree().change_scene_to_file(next_scene)
