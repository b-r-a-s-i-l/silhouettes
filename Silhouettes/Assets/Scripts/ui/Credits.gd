extends Control

func _process(_delta):
	if Input.is_action_just_pressed("cancel"):
		SceneChanger.change_scene(Global.Scenes.HOME)
