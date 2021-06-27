extends KinematicBody2D

export (Global.Layer) var place
export (Global.Layer) var interager_place =  Global.Layer.ANY
export (String) var interager_code = ""
export (Global.Obj_Color) var color = Global.Obj_Color.YELLOW
export (int) var gravity = 4000

var object
var velocity = Vector2.ZERO

func _ready():
	object = Global.connect("BOX_INTERAGER", self, "check_interager")
	set_place()
	modulate = Global.colorizire(color, Global.check_visibility(place))
	
func _process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	modulate = Global.colorizire(color, Global.check_visibility(place))
	check_interaction()

func set_place():
	match place:
		Global.Layer.FRONT:
			set_collision_mask_bit(Global.Mask.FRONTLAYER, true)
			set_collision_mask_bit(Global.Mask.FOWARDLAYER, false)
		Global.Layer.FOWARD:
			set_collision_mask_bit(Global.Mask.FRONTLAYER, false)
			set_collision_mask_bit(Global.Mask.FOWARDLAYER, true)
		Global.Layer.ANY:
			set_collision_mask_bit(Global.Mask.FRONTLAYER, true)
			set_collision_mask_bit(Global.Mask.FOWARDLAYER, true)

func check_interaction():
	if interager_place == Global.Layer.ANY:
		set_collision_mask_bit(Global.Mask.PLAYER, true)
	else:
		if modulate.a == Global.IS_VISIBLE:
			set_collision_mask_bit(Global.Mask.PLAYER, true)
		else:
			set_collision_mask_bit(Global.Mask.PLAYER, false)



func check_interager(received_code):
	if received_code == interager_code:
		match interager_place:
			Global.Layer.FRONT:
				set_collision_mask_bit(Global.Mask.FRONTLAYER, true)
				set_collision_mask_bit(Global.Mask.FOWARDLAYER, false)
			Global.Layer.FOWARD:
				set_collision_mask_bit(Global.Mask.FRONTLAYER, false)
				set_collision_mask_bit(Global.Mask.FOWARDLAYER, true)
			Global.Layer.ANY:
				set_collision_mask_bit(Global.Mask.FRONTLAYER, true)
				set_collision_mask_bit(Global.Mask.FOWARDLAYER, true)
