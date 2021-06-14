extends AudioStreamPlayer

onready var music = $"."

func _process(_delta):
	if !music.playing:
		music.play()
