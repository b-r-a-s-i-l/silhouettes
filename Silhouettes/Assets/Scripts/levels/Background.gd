extends Sprite

export (Global.Obj_Color) var color = Global.Obj_Color.YELLOW

func _ready():
	modulate = colorize()

func colorize():
	match color:
		Global.Obj_Color.SILHOUETTE:
				return Color(.04, .04, .04, 1)
		Global.Obj_Color.YELLOW:
				return Color(1, .94, .17, 1)
		Global.Obj_Color.YELLOW_GREEN:
				return Color(.7, .8, .35, 1)
		Global.Obj_Color.GREEN:
				return Color(.51, .72, .38, 1)
		Global.Obj_Color.LIGHT_BLUE:
				return Color(.45, .69, .67, 1)
		Global.Obj_Color.BLUE:
				return Color(.17, .68, .9, 1)
		Global.Obj_Color.OCEAN_BLUE:
				return Color(.39, .53, .76, 1)
		Global.Obj_Color.PURPLE:
				return Color(.46, .3, .58, 1)
		Global.Obj_Color.VIOLET:
				return Color(.58, .27, .58, 1)
		Global.Obj_Color.RED:
				return Color(.8, .21, .25, 1)
		Global.Obj_Color.PUMPKIN:
				return Color(.89, .64, .25, 1)
		Global.Obj_Color.ORANGE:
				return Color(.82, .74, .38, 1)

