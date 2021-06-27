extends Node2D

#ENUMS
enum Layer { 
	FRONT
	FOWARD
	ANY
}

enum Lever { 
	OFF
	ON
}

enum Button { 
	RELEASED
	PRESSED
}

enum Door {
	LOCKED
	UNLOCKED
}

enum Mask {
	PLAYER
	WALL
	FRONTLAYER
	FOWARDLAYER
	LEVER
	DOOR
	BOX
	BUTTON
}

enum Menu_Options{
	NOVOJOGO
	FASES
	OPCOES
	SAIR
}

enum Menu_Stages{
	FASE1
	FASE2
	FASE3
	FASE4
}

enum Scenes{
	HOME
	STAGES
	OPTIONS
	STAGE1
	STAGE2
	STAGE3
	STAGE4
	QUIT
}

enum Obj_Color{
	SILHOUETTE
	YELLOW
	YELLOW_GREEN
	GREEN
	LIGHT_BLUE
	BLUE
	OCEAN_BLUE
	PURPLE
	VIOLET
	RED
	SALMON
	PUMPKIN
	ORANGE
}


#GLOBALS VARIABLES
var ACTUAL_LAYER = Layer.FRONT
var ACTUAL_STAGE = Scenes.HOME
var LEVELS_UNLOCKED = 1

#GLOBALS CONST
const IS_VISIBLE = 1
const IS_NOT_VISIBLE = 0.6

#SIGNALS
signal LAYER_CHANGE
signal LAYER_ROTATE
signal DOOR_UNLOCKED
signal BOX_INTERAGER

#FUNCTIONS

### IN GAME
func change_layer(layer_to_active):
	ACTUAL_LAYER = layer_to_active
	emit_signal("LAYER_CHANGE")

func rotate_layer():
	emit_signal("LAYER_ROTATE")

func door_unlocked():
	emit_signal("DOOR_UNLOCKED")

func check_interager():
	emit_signal("BOX_INTERAGER")

func check_visibility(place):
	if place == ACTUAL_LAYER or place == Layer.ANY:
		return IS_VISIBLE
	else:
		return IS_NOT_VISIBLE
	
func colorizire(color, visible):
	if  color == Obj_Color.SILHOUETTE || visible == Global.IS_VISIBLE:
		return Color(.04, .04, .04, visible)
	else:
		match color:
			Obj_Color.YELLOW:
					return Color(1, .94, .17, visible)
			Obj_Color.YELLOW_GREEN:
					return Color(.7, .8, .35, visible)
			Obj_Color.GREEN:
					return Color(.51, .72, .38, visible)
			Obj_Color.LIGHT_BLUE:
					return Color(.45, .69, .67, visible)
			Obj_Color.BLUE:
					return Color(.17, .68, .9, visible)
			Obj_Color.OCEAN_BLUE:
					return Color(.39, .53, .76, visible)
			Obj_Color.PURPLE:
					return Color(.46, .3, .58, visible)
			Obj_Color.VIOLET:
					return Color(.58, .27, .58, visible)
			Obj_Color.RED:
					return Color(.8, .21, .25, visible)
			Obj_Color.PUMPKIN:
					return Color(.89, .64, .25, visible)
			Obj_Color.ORANGE:
					return Color(.82, .74, .38, visible)
					
		
func z_index_move(visible):
	if visible == Global.IS_VISIBLE:
		return 1
	else:
		return 0
