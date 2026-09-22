extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: Node = $"../../GameManager"

var picked_up = false

func _on_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	
	if _body.name == "Player" and picked_up == false:
		picked_up = true
		game_manager.add_score()
		animated_sprite_2d.visible = false
		audio_stream_player_2d.play()
		await get_tree().create_timer(0.5).timeout
		queue_free()
