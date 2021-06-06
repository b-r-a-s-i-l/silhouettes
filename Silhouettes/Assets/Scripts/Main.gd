extends Node

export (bool) var enable = false

func _ready():

	if (enable):
		SceneChanger.change_scene('res://assets/scenes/ui/home.tscn', 'fade_in', 'fade_out')




