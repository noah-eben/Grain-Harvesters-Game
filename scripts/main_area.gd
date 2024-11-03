extends Node2D

func _ready() -> void:
	run_dialogue("character1_TL")
	Dialogic.signal_event.connect(dialogueSignal)

func _process(delta: float) -> void:
	#run_dialogue("character1_TL")
	return

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func dialogueSignal(arg: String):
	if arg == "start_game_scene":
		print('signal received')
		SceneTransition.change_scene("res://scenes/grain_fill_sample_scene.tscn")
