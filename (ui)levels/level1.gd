extends Node2D

var lives
@onready var levelalreadycollectedcoins = Data.coins_data
var timer: Timer

func _physics_process(_delta: float) -> void:
	lives = Data.lives_data
	$CanvasLayer/coin_panal/Label.text = str(Data.coins_data)
	$CanvasLayer/live_panal/Label.text = str(lives)
	if lives < 0 && Data.current_payer_pos != Data.save_location:
		Data.coins_data = levelalreadycollectedcoins
		Data.lastfadout = true;
		timer = Timer.new()
		add_child(timer)
		timer.wait_time = 1.5
		timer.one_shot = true
		Data.labeltext = '''gotta try
harder next time'''
		timer.timeout.connect(self._on_timer_timeout)
		timer.start()

func collect_live():
	Data.lives_data += 1

func was_killed():
	Data.lives_data -= 1


func finish_level():
	Data.next_level = 2
	Data.labeltext = "Fantastic Work!"
	Data.lastfadout = true;
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.5
	timer.one_shot = true
	timer.timeout.connect(self._on_timer_timeout)
	timer.start()

func _on_timer_timeout() -> void:
	Data.lastfadein = true
	get_tree().change_scene_to_file("res://(ui)levels/start screen.tscn")
	queue_free()
