extends Control

func _ready() -> void:
	$Performance.text = 'Grade: ' + Global.finalScore()

func _on_button_pressed() -> void:
	get_tree().quit()
