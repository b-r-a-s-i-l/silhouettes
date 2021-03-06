extends CanvasLayer

onready var AnimationN := $Control/AnimationPlayer

var in_anim := ''
var out_anim := ''
var path := ''

func change_scene(new_scene):
	
	in_anim = 'fade_in'
	out_anim = 'fade_out'

	match (new_scene):
		Global.Scenes.HOME:
			path = 'res://assets/scenes/ui/home.tscn'
		Global.Scenes.STAGES:
			path = 'res://assets/scenes/ui/stages.tscn'
		Global.Scenes.OPTIONS:
			path = 'res://assets/scenes/ui/options.tscn'
		Global.Scenes.STAGE1:
			path = 'res://assets/scenes/levels/stage1.tscn'
		Global.Scenes.STAGE2:
			path = 'res://assets/scenes/levels/stage2.tscn'
		Global.Scenes.STAGE3:
			path = 'res://assets/scenes/levels/stage3.tscn'
		Global.Scenes.STAGE4:
			path = 'res://assets/scenes/levels/stage4.tscn'
		Global.Scenes.QUIT:
			get_tree().quit()
	
	AnimationN.play(in_anim)
	
	yield(AnimationN, 'animation_finished')
	
	get_tree().change_scene(path)
	AnimationN.play(out_anim)
	


