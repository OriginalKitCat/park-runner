extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
var timer: Timer
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var standing = true
var falling = false
var flying = false
var fallen = false
var waittime
var flyspeed

func _ready() -> void:
	_animated_sprite.play("STANDING")
	waittime = randf_range(1.5, 5)
	flyspeed = randf_range(0.75, 2.5)
	timer = Timer.new()
	add_child(timer) 
	timer.wait_time = waittime
	timer.one_shot = true
	timer.timeout.connect(self._on_timer_timeout)
	timer.start()

func _process(delta: float) -> void:
	if standing:
		_animated_sprite.play("STANDING")
	if falling:
		_animated_sprite.play("FALL")
		if is_on_floor():
			falling = false
			fallen = true
			timer.start()
	if flying:
		_animated_sprite.play("FLYING")
		velocity.y -= flyspeed
	if fallen:
		_animated_sprite.play("FALLEN")
	if not is_on_floor() and not flying:
		velocity.y += gravity * delta
	move_and_slide()


func _on_timer_timeout() -> void:
	if standing:
		standing = false
		flying = true
		timer.start()
		return
	if flying:
		flying = false
		falling = true
	if fallen:
		fallen = false
		standing = true
		timer.start()
		
