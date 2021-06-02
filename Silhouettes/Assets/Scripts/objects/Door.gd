extends Area2D

export (String) var unlocked_code = null
export (Global.Lever) var state = Global.Door.LOCKED
export (Global.Layer) var place = Global.Layer.FOWARD
export (Color) var color = Color.black

onready var animation = $"AnimationPlayer"

func _ready():
	Global.connect("DOOR_UNLOCKED", self, "door_unlocked")
	modulate = color

func _process(_delta):
	check_visibility()
	check_interaction()
	door_animation()
	
func check_visibility():
	modulate = Global.colorizire(color, Global.check_visibility(place)) 
	z_index = Global.z_index_move(Global.check_visibility(place))

func check_interaction():
	if modulate.a == Global.IS_VISIBLE:
		if $".".overlaps_body(get_node("../Player")) and Input.is_action_just_pressed("interaction"):
			if state == Global.Door.UNLOCKED:
				print ("END LEVEL")
			else:
				print ("THE DOOR IS LOCKED")

func door_unlocked(code_received):
	if code_received == unlocked_code:
		state = Global.Door.UNLOCKED

func door_animation():
	if state == Global.Door.UNLOCKED:
		animation.play("DoorUnlocked")
	else:
		animation.play("DoorLocked")
