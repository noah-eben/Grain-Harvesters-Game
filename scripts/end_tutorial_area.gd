extends Node2D

func _ready() -> void:
	print("end_tutorial")
	run_dialogue("timeline_5")
	Dialogic.signal_event.connect(dialogueSignal)

func _process(delta: float) -> void:
	return

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func dialogueSignal(arg: String):
	if arg == "end_tutorial":
		print('Okay...?')
		SceneTransition.change_scene("res://scenes/Story 1/storyOneMainArea.tscn")
		print('did it work?')
