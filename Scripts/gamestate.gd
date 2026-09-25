extends Node

var score: int=0
var level: int=1
var lives: int=3

func reset():
	score = 0
	level = 1
	lives = 3
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
