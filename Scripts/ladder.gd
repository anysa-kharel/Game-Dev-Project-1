extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.enter_ladder()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.exit_ladder()
