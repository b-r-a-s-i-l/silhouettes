extends Area2D

export (bool) var one_shot = false
export (Global.Layer) var place = Global.Layer.ANY
export (Global.Obj_Color) var color = Global.Obj_Color.YELLOW

var state = Global.Button.RELEASED
var trigered = false

func _ready():
	modulate = Global.colorizire(color, Global.check_visibility(place))

func _process(_delta):
	check_visibility()

	if !trigered:
		check_interaction()


func check_visibility():
	modulate = Global.colorizire(color, Global.check_visibility(place))
	z_index = Global.z_index_move(Global.check_visibility(place))

func check_interaction():
	if modulate.a == Global.IS_VISIBLE:
		if $".".overlaps_body($"../../Player"):
			if state == Global.Button.RELEASED:
				$AnimationPlayer.play("on")
				state = Global.Button.PRESSED
				send_code()
				if one_shot:
					trigered = true
		elif state == Global.Button.PRESSED:
			$AnimationPlayer.play("off")
			state = Global.Button.RELEASED

func send_code():
	if state == Global.Button.PRESSED:
		$AudioStreamPlayer.play()
		Global.emit_signal("LAYER_ROTATE")
			
