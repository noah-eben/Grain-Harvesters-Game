extends Node2D

@onready var red_zone: ColorRect = $redZone
@onready var yellow_zone: ColorRect = $yellowZone
@onready var green_zone: ColorRect = $greenZone
@onready var moving_bar: ColorRect = $movingBar
@onready var grain_level: ColorRect = $grainLevel
@onready var score_label: Label = $ScoreDisplay/ScoreHUD/ScoreLabel
@onready var score_display: Control = $ScoreDisplay

@onready var isBarMoving: bool = true
@onready var isAccelerating: bool = false
@onready var hasBeenPressed: bool = false
@onready var score: String = 'nil'
@onready var barSpeed: float = 0.00
@onready var acceleration: float = 30.00
@onready var decceleration: float = 40.00
@onready var maxSpeed: float = 10.00
@onready var finishedPlaying = false

func _ready() -> void:
	score_display.visible = false
	return

func _process(delta: float) -> void:
	updateBar(delta)
	trackBar(delta)
	grainBar(delta)
	displayScore(delta)
	return

func updateBar(delta):
	if not isBarMoving:
		return
	
	if hasBeenPressed == false:
		if Input.is_action_pressed('ui_accept'):
			isAccelerating = true
		
		if Input.is_action_just_released("ui_accept"):
			isAccelerating = false
			hasBeenPressed = true

	
	if isAccelerating:
		barSpeed = barSpeed + acceleration * delta
	else:
		barSpeed = barSpeed - decceleration * delta
	
	if barSpeed <= 0:
		barSpeed = 0
	elif barSpeed >= maxSpeed:
		barSpeed = maxSpeed
	
	if barSpeed == 0 and hasBeenPressed == true:
		finishedPlaying = true
	
	if moving_bar.position.x > (red_zone.position.x + red_zone.size.x):
		moving_bar.position.x = red_zone.position.x + red_zone.size.x - moving_bar.size.x
	
	moving_bar.position.x += barSpeed
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
	#print(score)
	return score

func grainBar(delta):
	return

func displayScore(delta):
	if finishedPlaying == true:
		score_display.visible = true
		score_label.text = "Score:  " + trackBar(delta)
		print(trackBar(delta))
	return

func _on_button_pressed() -> void:
	SceneTransition.change_scene("res://scenes/Story 1/storyOneHumidityLevel.tscn")
