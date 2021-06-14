extends Control

export (Global.Menu_Options) var menu = Global.Menu_Options.NOVOJOGO

onready var jogo = $"NovoJogo/AnimationPlayer"
onready var fases = $"Fases/AnimationPlayer"
onready var opcao = $"Opção/AnimationPlayer"
onready var sair = $"Sair/AnimationPlayer"

var limit = false

func _ready():
	jogo.play("on")

func _process(_delta):
	get_input()
	play_animation()
	go_to_option()

func get_input():
	if Input.is_action_just_pressed("ui_up"):
		menu -= 1
		if menu < Global.Menu_Options.NOVOJOGO:
			menu = Global.Menu_Options.NOVOJOGO
	elif Input.is_action_just_pressed("ui_down"):
		menu += 1
		if menu > Global.Menu_Options.SAIR:
			menu = Global.Menu_Options.SAIR

func play_animation():
	if Input.is_action_just_pressed("ui_up"):
		match (menu):
			Global.Menu_Options.NOVOJOGO:
				if !limit:
					jogo.play("on")
					fases.play("off")
					limit = true
			Global.Menu_Options.FASES:
				fases.play("on")
				opcao.play("off")
				limit = false
			Global.Menu_Options.OPCOES:
				opcao.play("on")
				sair.play("off")
			Global.Menu_Options.SAIR:
				return
	elif Input.is_action_just_pressed("ui_down"):
		match (menu):
			Global.Menu_Options.NOVOJOGO:
				return
			Global.Menu_Options.FASES:
				jogo.play("off")
				fases.play("on")
			Global.Menu_Options.OPCOES:
				fases.play("off")
				opcao.play("on")
				limit = false
			Global.Menu_Options.SAIR:
				if !limit:
					opcao.play("off")
					sair.play("on")
					limit = true

func go_to_option():
	if Input.is_action_just_pressed("interaction"):
		$"UI - Confirm".play()
		match (menu):
			Global.Menu_Options.NOVOJOGO:
				SceneChanger.change_scene(Global.Scenes.STAGE1)
			Global.Menu_Options.FASES:
				SceneChanger.change_scene(Global.Scenes.STAGES)
			Global.Menu_Options.OPCOES:
				SceneChanger.change_scene(Global.Scenes.OPTIONS)
			Global.Menu_Options.SAIR:
				SceneChanger.change_scene(Global.Scenes.QUIT)
