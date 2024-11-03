extends AudioStreamPlayer2D

const level_music = preload("res://music/Interior Birdecorator Decorate.ogg")

func playMusic(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()

func play_level_music():
	playMusic(level_music)


func _on_finished() -> void:
	play_level_music()
