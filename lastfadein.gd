extends Control

var transparency_value = 0
var somerandomtimer : Timer;

func _ready():
	transparency_value = 0
	modulate = Color(1, 1, 1, 0)

	Data.lastfadout = false

func _physics_process(delta: float) -> void:
	if Data.lastfadein && transparency_value <= 0: 
		transparency_value = 1
		$Label.text = Data.labeltext
		visible = true
	if Data.lastfadein and transparency_value <= 1: 
		transparency_value -= delta * 2 
	if Data.lastfadein and transparency_value <= 0:
		Data.lastfadein = false; transparency_value = 0; 
		visible = false
		Data.playermovement = true;


	transparency_value = clamp(transparency_value, 0.0, 1.0)
	modulate = Color(1, 1, 1, transparency_value)
