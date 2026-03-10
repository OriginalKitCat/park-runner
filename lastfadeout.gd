extends Control

var transparency_value = 0
var somerandomtimer : Timer;

func _ready():
	transparency_value = 0
	modulate = Color(1, 1, 1, 0)

	Data.lastfadout = false

func _physics_process(delta: float) -> void:
	if Data.lastfadout and transparency_value < 1:
		$Label.text = Data.labeltext
		transparency_value += delta * 2
		Data.playermovement = false
	if Data.deathfade_begin and transparency_value >= 1:
		Data.deathfade_begin = false;
		transparency_value = 1;

	transparency_value = clamp(transparency_value, 0.0, 1.0)
	modulate = Color(1, 1, 1, transparency_value)
