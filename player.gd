extends CharacterBody2D

const run_speed = 300.0
const jump_velocity = -400.0
var windspeed = 0
@onready var _animation_player = $AnimationPlayer
var timer : Timer;

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	_animation_player.play("standing")
	Data.save_location = global_position
	Data.current_payer_pos = global_position
	

func  _physics_process(delta: float) -> void:
	Data.current_payer_pos = global_position
	if Data.was_killed == true:
		Data.deathfade_begin = true;
		timer = Timer.new()
		add_child(timer)
		timer.wait_time = 0.6
		timer.one_shot = true
		timer.timeout.connect(self._on_timer_timeout)
		timer.start()
		Data.was_killed = false

	if Data.travel_with_underground == true:
		global_position = Data.undergroundpos
		Data.travel_with_underground = false
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and Data.playermovement:
		velocity.x = direction * run_speed
		$PlayerWaiting.flip_h = (direction == -1)
	else:
		velocity.x =move_toward(velocity.x, 0, run_speed)
	velocity.x += Data.wind
	move_and_slide()

func _on_timer_timeout() -> void:
	global_position = Data.save_location
