extends Node
@onready var score: Control = $"../CanvasLayer/Control/VBoxContainer/Score/Label"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score.text = str(GameState.score)

func add_score():
	GameState.score += 1
	score.text = str(GameState.score)

func _process(delta: float) -> void:
	pass
