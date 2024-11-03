extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed():
	print("Start Pressed")
	SceneTransition.change_scene("res://scenes/main_area.tscn")

func _on_settings_pressed():
	print("Settings Pressed")


func _on_exit_pressed():
	get_tree().quit()
