extends Node2D

export (Global.Layer) var start_layer = Global.Layer.FRONT
export (Global.Scenes) var level = Global.Scenes.STAGE1

func _ready():
	set_start_layer()
	Global.ACTUAL_STAGE = level

func set_start_layer():
	Global.change_layer(start_layer)

func _process(_delta):
	if Input.is_action_just_pressed("rotate"):
		SceneChanger.change_scene(level)
	if Input.is_action_just_pressed("cancel"):
		SceneChanger.change_scene(Global.Scenes.HOME)
