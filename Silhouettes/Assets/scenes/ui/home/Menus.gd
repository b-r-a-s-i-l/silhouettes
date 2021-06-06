extends Control

export (Global.Menu_Options) var menu = Global.Menu_Options.NOVOJOGO

onready var animation = $"AnimationPlayer"

func _process(_delta):
	get_input()
	print(menu)

func get_input():
	if Input.is_action_just_pressed("ui_up"):
		menu -= 1
		if menu < Global.Menu_Options.NOVOJOGO:
			menu = Global.Menu_Options.NOVOJOGO
		if menu == 0:
			animation.play_backwards("fases")
			#animation.play("jogo")
		elif menu == 1:
			animation.play_backwards("opcoes")
			#animation.play("fases")
		elif menu == 2:
			animation.play_backwards("sair")
			#animation.play("opcoes")	
	if Input.is_action_just_pressed("ui_down"):
		menu += 1
		if menu > Global.Menu_Options.SAIR:
			menu = Global.Menu_Options.SAIR
		if menu == 1:
			animation.play_backwards("jogo")
			#animation.play("fases")
		elif menu == 2:
			animation.play_backwards("fases")
			#animation.play("opcoes")
		elif menu == 3:
			animation.play_backwards("opcoes")
			#animation.play("sair")	


	