extends TileMap

export (String) var code = "layer"
export (Global.Layer) var layer_ID =  Global.Layer.FRONT
export (Color) var color = Color.black

var tiles_position = []
var tiles_cells = []
var cells = []
var is_collided = false

const PLAYER = 0
const SILHOUETTE = 7

func _ready():
	Global.connect("LAYER_CHANGE", self, "check_is_active")
	Global.connect("LAYER_ROTATE", self, "rotate_layer")
	modulate = color
	capture_cells()

func check_is_active():
	if Global.ACTUAL_LAYER == layer_ID:
		is_collided = true
		modulate  = Global.colorizire(color, Global.IS_VISIBLE)
		
		var _cells = cells
		for i in range(0, tiles_position.size()):
			set_cellv(_cells[0][i], SILHOUETTE)
			
		z_index = 1
	else:
		is_collided = false
		modulate  = Global.colorizire(color, Global.IS_NOT_VISIBLE)
		var _cells = cells
		for i in range(0, tiles_position.size()):
			set_cellv(_cells[0][i], _cells[1][i])
			
		z_index = 0
		
	set_collision_mask_bit(PLAYER, is_collided)

func capture_cells():
	tiles_position = get_used_cells()
	
	for tile in tiles_position:
		tiles_cells.push_back(get_cellv(tile))
		
	cells.push_back(tiles_position)
	cells.push_back(tiles_cells)

func rotate_layer():
	if Global.ACTUAL_LAYER != layer_ID:
		rotate(deg2rad(90))
