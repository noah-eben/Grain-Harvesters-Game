extends Node2D

@onready var table = {'A' = 3, 'B' = 2, 'C' = 1}
@onready var story_one_score: float = 0.00
@onready var story_two_score: float = 0.00
@onready var story_three_score: float = 0.00

func _ready() -> void:
	return

func finalScore():
	var value = story_one_score + story_two_score + story_three_score
	if value/3 <= 1:
		return 'Poor'
	elif value/3 >= 3:
		return 'Perfect'
	else:
		return 'Fair'
