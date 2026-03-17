extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	$"..".collect_live()
	queue_free()
