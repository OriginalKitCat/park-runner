extends Node2D

var version = Data.version
@onready var player = $player
var load_this_level
var coins = Data.coins_data
 
func _ready() -> void:
	$Control/version.text = version
	$Control/coin_panal/Label.text = str(coins)
	


func _on_play_button_button_down() -> void:
	#var current_Scene_file = get_tree().current_scene.scene_file_path
	#print(current_Scene_file)
	Data.lives_data = 3
	Data.deathfade_begin = false
	Data.deathfade_end = false
	var next_scene = "res://(ui)levels/level" + str(Data.next_level) + ".tscn"
	get_tree().change_scene_to_file(next_scene)
	

	
func levelup():
	load_this_level += 1

func _on_level_finished(updated_coins):
	coins = updated_coins
	print("Coins: ", coins)
	self.show()


func _on_select_level_button_button_down() -> void:
	Data.lives_data = 3
	Data.deathfade_begin = false
	Data.deathfade_end = false
	get_tree().change_scene_to_file("res://(ui)levels/level_select.tscn")
