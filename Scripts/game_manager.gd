extends Node
@onready var score: Control = $"../CanvasLayer/Control/VBoxContainer/Score/Label"
@onready var lives: Control = $"../CanvasLayer/Control/VBoxContainer/Hearts/Label"


func next_level():	
	if GameState.level == 1:
		get_tree().call_deferred(
		"change_scene_to_file","res://Scenes/Levels/level_2.tscn")
		GameState.level += 1
	elif GameState.level == 2:
		get_tree().call_deferred(
		"change_scene_to_file","res://Scenes/Levels/level_3.tscn")
		GameState.level += 1
	else:
		get_tree().call_deferred(
		"change_scene_to_file","res://Scenes/Levels/level_2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score.text = str(GameState.score)

func add_score():
	GameState.score += 1
	score.text = str(GameState.score)

func lose_life() -> void:
	GameState.lives -= 1
	lives.text = str(GameState.lives)
	
func game_over() -> void:
	get_tree().call_deferred(
		"change_scene_to_file",
		"res://Scenes/game_over.tscn"
	)
func _process(_delta: float) -> void:
	pass
