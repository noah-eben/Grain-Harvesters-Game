extends Node2D

func _ready() -> void:
	run_dialogue("story_one_conversation_B")
	Dialogic.signal_event.connect(dialogueSignal)

func _process(delta: float) -> void:
	#run_dialogue("character1_TL")
	return

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func dialogueSignal(arg: String):
	if arg == "start_next_scene":
		print('start_next_scene')
		SceneTransition.change_scene("res://scenes/Story 2/storyTwoMainArea.tscn")
