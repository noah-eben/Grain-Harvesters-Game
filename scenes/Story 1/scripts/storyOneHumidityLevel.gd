extends Node2D

@onready var level_bar: ColorRect = $LevelBar
@onready var range_bar: ColorRect = $RangeBar
@onready var humidity_bar: ColorRect = $HumidityBar
@onready var humidity_bar_area: Area2D = $HumidityBar/HumidityBarArea
@onready var top: Marker2D = $MeterBar/Top
@onready var bottom: Marker2D = $MeterBar/Bottom
@onready var meter_bar: ColorRect = $MeterBar
@onready var meter_bar_level: ColorRect = $MeterBar/MeterBarLevel
@onready var score_display: Control = $ScoreDisplay
@onready var score_label: Label = $ScoreDisplay/ScoreHUD/ScoreLabel

@onready var score: String = 'nil'
@onready var speed: float = 0.00
@onready var max_speed: float = 40.00
@onready var acceleration: float = 14.00
@onready var decceleration: float = 14.00

@onready var level_speed: float = 0.00
@onready var max_level_speed: float = 1.00
@onready var level_acceleration: float = 2.00
@onready var level_decceleration: float = 1.00

@onready var new_pos: float = 350
@onready var t = 0.0
@onready var finishedPlaying: bool = false

func _ready() -> void:
	score = 'nil'
	score_display.visible = false
	return

func _process(delta: float) -> void:
	if finishedPlaying == true:
		return
	
	updateLevelBar(delta)
	updateMeterBar(delta)
	moveHumidity(delta)
	displayScore(delta)
	
	#t += delta * 0.4
	#print(new_pos)
	#humidity_bar.position = humidity_bar.position.lerp(Vector2(humidity_bar.position.x,new_pos),t)
	#new_pos = randf_range(range_bar.position.y,range_bar.position.y + range_bar.size.y)
	#humidity_bar.position = humidity_bar.position.lerp(Vector2(humidity_bar.position.x,new_pos),t)

func moveHumidity(delta):
	#print(new_pos)
	#new_pos = randf_range(range_bar.position.y,range_bar.position.y + range_bar.size.y)
	#var tween = create_tween()
	#tween.tween_property(humidity_bar, "position", Vector2(humidity_bar.position.x,new_pos),1)
	
	return

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed('ui_cancel'):
		get_tree().quit()
	return

func updateLevelBar(delta):
	if Input.is_action_pressed("ui_accept"):
		speed = speed + delta * acceleration
		if speed >= max_speed:
			speed = max_speed
	else:
		speed = speed - delta * decceleration
		if speed <= -max_speed:
			speed = -max_speed
	level_bar.position.y -= speed
	
	if level_bar.position.y >= range_bar.position.y + range_bar.size.y - level_bar.size.y:
		level_bar.position.y = range_bar.position.y + range_bar.size.y -  level_bar.size.y
		speed = 0
	elif level_bar.position.y <= range_bar.position.y:
		level_bar.position.y = range_bar.position.y
		speed = 0
	return

func updateMeterBar(delta):
	if humidity_bar_area.has_overlapping_areas():
		level_speed = level_speed + delta * level_acceleration
		if level_speed >= max_level_speed:
			level_speed = max_level_speed
	else:
		level_speed = level_speed - delta * level_decceleration
		if level_speed <= -max_level_speed:
			level_speed = -max_level_speed
	top.position.y -= level_speed
	#print(meter_bar_level.size.y)
		
	if top.position.y >= bottom.position.y:
		top.position.y = bottom.position.y
		score = 'Score: F'
		finishedPlaying = true
	elif top.position.y <= meter_bar.position.y - 50:
		top.position.y = meter_bar.position.y - 50
		score = 'Score: A'
		finishedPlaying = true
	
	meter_bar_level.size.y = bottom.position.y - top.position.y
	meter_bar_level.position.y = top.position.y
	return

func displayScore(delta):
	if finishedPlaying == true:
		score_display.visible = true
		score_label.text = score
	return

func _on_timer_timeout() -> void:
	if finishedPlaying == true:
		return
	print(new_pos)
	new_pos = randf_range(range_bar.position.y,range_bar.position.y + range_bar.size.y - humidity_bar.size.y)
	var tween = create_tween()
	tween.tween_property(humidity_bar, "position", Vector2(humidity_bar.position.x,new_pos),2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	return


func _on_button_pressed() -> void:
	SceneTransition.change_scene("res://scenes/Story 1/storyOnePriceStock.tscn")
