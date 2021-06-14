extends Node

export (bool) var enable = false

func _ready():

	if (enable):
		SceneChanger.change_scene(Global.Scenes.HOME)




