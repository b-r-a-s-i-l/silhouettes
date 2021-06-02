extends KinematicBody2D

export (Global.Layer) var place
export (int) var gravity = 4000

var velocity = Vector2.ZERO

func _ready():
	match place:
		Global.Layer.FRONT:
			set_collision_mask_bit(Global.Mask.FRONTLAYER, true)
		Global.Layer.FOWARD:
			set_collision_mask_bit(Global.Mask.FOWARDLAYER, true)
		Global.Layer.ANY:
			set_collision_mask_bit(Global.Mask.FRONTLAYER, true)
			set_collision_mask_bit(Global.Mask.FOWARDLAYER, true)
	
func _process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
