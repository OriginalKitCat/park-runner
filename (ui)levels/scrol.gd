extends CharacterBody2D
var scrolling = false
var top_limit: float
var bottom_limit: float
var last_mouse_y: float
const CONTENT_TRAVEL = 800.0

func _ready() -> void:
	call_deferred("init_limits")

func init_limits() -> void:
	top_limit = global_position.y
	bottom_limit = top_limit + 180.0
	

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("click_left"):
		scrolling = true
		last_mouse_y = get_global_mouse_position().y
	
	if Input.is_action_just_released("click_left"):
		scrolling = false

	if scrolling:
		var mouse_delta = get_global_mouse_position().y - last_mouse_y
		last_mouse_y = get_global_mouse_position().y
		
		global_position.y = clamp(global_position.y + mouse_delta, top_limit, bottom_limit)
		
		var t = (global_position.y - top_limit) / (bottom_limit - top_limit)
		$"../Panel/levels".position.y = lerp(-270.0, -CONTENT_TRAVEL, t)

	move_and_slide()
