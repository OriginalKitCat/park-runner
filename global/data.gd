extends Node

var player
var current_payer_pos = null
var save_location = null
var was_killed
var coins_data = 0
var wind = 0
var lives_data = 3
var version = "7.8.4"
var next_level = 0
var undergroundpos
var travel_with_underground
var deathfade_begin = false
var deathfade_end = false
var playermovement = true
var lastfadout = false
var lastfadein = false
var showrestartmenu = false
var labeltext = '''gotta try
harder next time'''
var max_coins_earnd_in =  [0, 0 , 0]
func setvalue(value: int):
	coins_data = value
