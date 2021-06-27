extends Area2D

export (String) var code = null
export (Global.Layer) var place = Global.Layer.ANY
export (Global.Obj_Color) var color = Global.Obj_Color.YELLOW

func _ready():
	modulate = Global.colorizire(color, Global.check_visibility(place))

func _process(_delta):

	if $"." != null:
		check_visibility()
		check_interaction()
	

func check_visibility():
	modulate = Global.colorizire(color, Global.check_visibility(place))
	z_index = Global.z_index_move(Global.check_visibility(place))

func check_interaction():
	if modulate.a == Global.IS_VISIBLE:
		if $".".overlaps_body($"../../Player"):
			send_code()
			

func send_code():
	$"AudioStreamPlayer".play()
	Global.emit_signal("DOOR_UNLOCKED", code)
	queue_free()

