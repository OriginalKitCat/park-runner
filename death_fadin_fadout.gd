extends Control

var transparency_value = 0
var somerandomtimer : Timer;

func _physics_process(delta: float) -> void:
	if Data.deathfade_end and transparency_value > 0:
		transparency_value -= delta * 2
	elif Data.deathfade_begin and transparency_value < 1:
		transparency_value += delta * 2
		Data.playermovement = false
	if Data.deathfade_end and transparency_value <= 0.0:
		Data.deathfade_end = false
	if Data.deathfade_begin and transparency_value >= 1:
		Data.deathfade_begin = false;
		somerandomtimer = Timer.new()
		add_child(somerandomtimer)
		somerandomtimer.wait_time = 1.5
		somerandomtimer.one_shot = true
		somerandomtimer.timeout.connect(self._on_timer_timeout)
		somerandomtimer.start()

	transparency_value = clamp(transparency_value, 0.0, 1.0)
	modulate = Color(1, 1, 1, transparency_value)

func _on_timer_timeout() -> void:
	Data.deathfade_end = true
	Data.playermovement = true
