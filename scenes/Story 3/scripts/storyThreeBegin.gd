extends Node2D

func _ready() -> void:
	run_dialogue("story_three_conversation_A")
	Dialogic.signal_event.connect(dialogueSignal)

func _process(delta: float) -> void:
	#run_dialogue("character1_TL")
	return

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func dialogueSignal(arg: String):
	if arg == "start_next_scene":
		print('Starting Story 3 Now')
		SceneTransition.change_scene("res://scenes/Story 3/storyThreeGrainFill.tscn")
