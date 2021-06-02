extends CanvasLayer

onready var AnimationN := $Control/AnimationPlayer

var out_anim := ''

func change_scene(new_scene, in_anim, out_anim):
	
	
	AnimationN.play(in_anim)
	
	yield(AnimationN, 'animation_finished')
	
	get_tree().change_scene(new_scene)
	AnimationN.play(out_anim)
	


