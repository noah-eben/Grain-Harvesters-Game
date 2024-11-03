extends Node2D

@onready var red_zone: ColorRect = $redZone
@onready var yellow_zone: ColorRect = $yellowZone
@onready var green_zone: ColorRect = $greenZone
@onready var moving_bar: ColorRect = $movingBar
@onready var score_display: Control = $ScoreDisplay
@onready var score_label: Label = $ScoreDisplay/ScoreHUD/ScoreLabel

@onready var isBarMoving: bool = true
@onready var score: String = 'nil'
@onready var barSpeed: float = 900.00
@onready var finishedPlaying = false

func _ready() -> void:
	score_display.visible = false
	return

func _process(delta: float) -> void:
	moveBar(delta)
	trackBar(delta)
	stopBar(delta)
	displayScore(delta)
	return

func moveBar(delta):
	if not isBarMoving:
		return
	
	moving_bar.position.x += barSpeed * delta
	
	if moving_bar.position.x > red_zone.position.x + red_zone.size.x:
		barSpeed = -barSpeed
	
	if moving_bar.position.x < red_zone.position.x:
		barSpeed = -barSpeed
	
	return

func trackBar(delta):
	if yellow_zone.position.x < moving_bar.position.x and moving_bar.position.x < yellow_zone.position.x + yellow_zone.size.x:
		score = 'B'
		if green_zone.position.x < moving_bar.position.x + moving_bar.size.x/2 and moving_bar.position.x < green_zone.position.x + green_zone.size.x:
			score = "A"
			return score
		return score
	else:
		score = 'C'
	return score

func stopBar(delta):
	if Input.is_action_just_pressed('ui_accept'):
		isBarMoving = false
		finishedPlaying = true
	return

func displayScore(delta):
	if finishedPlaying == true:
		score_display.visible = true
		score_label.text = "Score:  " + trackBar(delta)
	return

func _on_button_pressed() -> void:
	Global.story_three_score += Global.table[score]
	SceneTransition.change_scene("res://scenes/Story 3/storyThreeEndArea.tscn")
