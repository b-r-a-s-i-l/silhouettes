extends Area2D

export (String) var code = null
export (Global.Lever) var send_when_state = Global.Lever.ON
export (Global.Layer) var place = Global.Layer.ANY
export (Global.Lever) var state = Global.Lever.OFF
export (Color) var color = Color.black

func _ready():
	modulate = color

func _process(_delta):
	update_state()
	check_visibility()
	check_interaction()
	send_code()
	
func update_state():
	if state == Global.Lever.OFF:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true

func check_visibility():
	modulate = Global.colorizire(color, Global.check_visibility(place))
	z_index = Global.z_index_move(Global.check_visibility(place))

func check_interaction():
	if modulate.a == Global.IS_VISIBLE:
		if $".".overlaps_body($"../Player") and Input.is_action_just_pressed("interaction"):
			if state == Global.Lever.OFF:
				state = Global.Lever.ON
			else:
				state = Global.Lever.OFF

func send_code():
	if state == send_when_state:
		if code == "layer":
			Global.change_layer(state)
		else:
			Global.emit_signal("DOOR_UNLOCKED", code)
