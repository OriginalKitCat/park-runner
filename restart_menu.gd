extends Control

func _ready() -> void:
	visible = false

func _physics_process(_delta: float) -> void:
	if Data.showrestartmenu:
		visible = true
		Data.playermovement = false

func _on_cancel_button_down() -> void:
	Data.showrestartmenu = false
	visible = false
	Data.playermovement = true

func _on_respawn_button_down() -> void:
	Data.showrestartmenu = false
	visible = false
	Data.was_killed = true
	Data.lives_data -= 1

func _on_return_to_meu_button_down() -> void:
	Data.showrestartmenu = false
	visible = false
	Data.lives_data = -1
