extends Node2D

export (Global.Layer) var start_layer = Global.Layer.FRONT

func _ready():
	set_start_layer()

func set_start_layer():
	Global.change_layer(start_layer)


