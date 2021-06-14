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


#GLOBALS VARIABLES
var ACTUAL_LAYER = Layer.FRONT
var LEVELS_UNLOCKED = 1

#GLOBALS CONST
const IS_VISIBLE = 1
const IS_NOT_VISIBLE = 0.6

#SIGNALS
signal LAYER_CHANGE
signal LAYER_ROTATE
signal DOOR_UNLOCKED


#FUNCTIONS

### IN GAME
func change_layer(layer_to_active):
	ACTUAL_LAYER = layer_to_active
	emit_signal("LAYER_CHANGE")

func rotate_layer():
	emit_signal("LAYER_ROTATE")

func door_unlocked():
	emit_signal("DOOR_UNLOCKED")

func check_visibility(place):
	if place == ACTUAL_LAYER or place == Layer.ANY:
		return IS_VISIBLE
	else:
		return IS_NOT_VISIBLE
	
func colorizire(color, visible):
	if visible == Global.IS_VISIBLE:
		return Color.black
	else:
		return Color(color.r, color.g, color.b, Global.IS_NOT_VISIBLE)
		
func z_index_move(visible):
	if visible == Global.IS_VISIBLE:
		return 1
	else:
		return 0
