extends Area2D

export (String) var unlocked_code = null
export (Global.Lever) var state = Global.Door.LOCKED
export (Global.Layer) var place = Global.Layer.FOWARD
export (Global.Scenes) var next_scene =  Global.Scenes.HOME
export (Global.Obj_Color) var color = Global.Obj_Color.YELLOW

onready var animation = $"AnimationPlayer"

var object
var sound = false

func _ready():
	object = Global.connect("DOOR_UNLOCKED", self, "door_unlocked")
	modulate = Global.colorizire(color, Global.check_visibility(place))

func _process(_delta):
	check_visibility()
	check_interaction()
	door_animation()
	
func check_visibility():
	modulate = Global.colorizire(color, Global.check_visibility(place)) 
	z_index = Global.z_index_move(Global.check_visibility(place))

func check_interaction():
	if modulate.a == Global.IS_VISIBLE:
		if $".".overlaps_body(get_node("../../Player")) and Input.is_action_just_pressed("interaction"):
			if state == Global.Door.UNLOCKED:
				go_next()
			else:
				print ("THE DOOR IS LOCKED")

func door_unlocked(code_received):
		if code_received == unlocked_code:
			state = Global.Door.UNLOCKED

func door_animation():
	if state == Global.Door.UNLOCKED:
		animation.play("DoorUnlocked")
		if !sound:
			$AudioStreamPlayer.play()
			sound = true
	else:
		animation.play("DoorLocked")

func go_next():
	if Global.LEVELS_UNLOCKED < 3:
		Global.LEVELS_UNLOCKED += 1
	SceneChanger.change_scene(next_scene)
