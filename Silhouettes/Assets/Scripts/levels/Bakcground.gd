extends Sprite

export (Color) var color = Color.black

func _ready():
	modulate = color
