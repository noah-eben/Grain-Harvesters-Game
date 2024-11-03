extends Node2D

var key_pressed = "a"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # code


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if key_pressed:
			if Input.is_action_just_pressed("ui_accept"):
				run_dialogue("character1_TL")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
