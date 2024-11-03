extends Node2D

func _ready() -> void:
	run_dialogue("timeline_5")
	Dialogic.signal_event.connect(dialogueSignal)

func _process(delta: float) -> void:
	#run_dialogue("character1_TL")
	return

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func dialogueSignal(arg: String):
	if arg == "end_tutorial":
		print('end of tutorial')
		SceneTransition.change_scene("res://scenes/menu.tscn")
