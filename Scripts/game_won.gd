extends Control

@onready var label_3: Label = $VBoxContainer/Label3

func _ready() -> void:
	label_3.text = "Coins:" + str(GameState.score) + "/47"



func _on_button_pressed() -> void:
	GameState.reset()
