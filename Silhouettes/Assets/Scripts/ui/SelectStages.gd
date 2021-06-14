extends Control

export (Global.Menu_Stages) var menu = Global.Menu_Stages.FASE1

onready var fase1 = $"Fase1/AnimationPlayer"
onready var fase2 = $"Fase2/AnimationPlayer"
onready var fase3 = $"Fase3/AnimationPlayer"
onready var fase4 = $"Fase4/AnimationPlayer"

var limit = false

func _ready():
	fase1.play("on")

func _process(_delta):
	get_ui_input()
	play_animation()
	go_to_option()

func get_ui_input():
	match (Global.LEVELS_UNLOCKED):
			1:
				if Input.is_action_just_pressed("ui_left"):
						menu = Global.Menu_Stages.FASE1
				elif Input.is_action_just_pressed("ui_right"):
						menu = Global.Menu_Stages.FASE1
			2:
				if Input.is_action_just_pressed("ui_left"):
					menu -= 1
					if menu < Global.Menu_Stages.FASE1:
						menu = Global.Menu_Stages.FASE1
				elif Input.is_action_just_pressed("ui_right"):
					menu += 1
					if menu > Global.Menu_Stages.FASE2:
						menu = Global.Menu_Stages.FASE2
			3:
				if Input.is_action_just_pressed("ui_left"):
					menu -= 1
					if menu < Global.Menu_Stages.FASE1:
						menu = Global.Menu_Stages.FASE1
				elif Input.is_action_just_pressed("ui_right"):
					menu += 1
					if menu > Global.Menu_Stages.FASE3:
						menu = Global.Menu_Stages.FASE3
			4:
				if Input.is_action_just_pressed("ui_left"):
					menu -= 1
					if menu < Global.Menu_Stages.FASE1:
						menu = Global.Menu_Stages.FASE1
				elif Input.is_action_just_pressed("ui_right"):
					menu += 1
					if menu > Global.Menu_Stages.FASE4:
						menu = Global.Menu_Stages.FASE4
	

func play_animation():
	if Global.LEVELS_UNLOCKED == 1:
		limit = true

	if Input.is_action_just_pressed("ui_left"):
		match (menu):
			Global.Menu_Stages.FASE1:
				if !limit:
					fase1.play("on")
					fase2.play("off")
					limit = true
			Global.Menu_Stages.FASE2:
				fase2.play("on")
				fase3.play("off")
				limit = false
			Global.Menu_Stages.FASE3:
				fase3.play("on")
				fase4.play("off")
				limit = false
			Global.Menu_Stages.FASE4:
				return
	elif Input.is_action_just_pressed("ui_right"):
		match (menu):
			Global.Menu_Stages.FASE1:
				return
			Global.Menu_Stages.FASE2:
				fase1.play("off")
				fase2.play("on")
				limit = false
			Global.Menu_Stages.FASE3:
				fase2.play("off")
				fase3.play("on")
				limit = false
			Global.Menu_Stages.FASE4:
				if !limit:
					fase3.play("off")
					fase4.play("on")
					limit = true

func go_to_option():
	if Input.is_action_just_pressed("interaction"):
		match (menu):
			Global.Menu_Stages.FASE1:
				SceneChanger.change_scene(Global.Scenes.STAGE1)
				pass
			Global.Menu_Stages.FASE2:
				SceneChanger.change_scene(Global.Scenes.STAGE2)
				pass
			Global.Menu_Stages.FASE3:
				SceneChanger.change_scene(Global.Scenes.STAGE3)
				pass
			Global.Menu_Stages.FASE4:
				SceneChanger.change_scene(Global.Scenes.STAGE4)
				pass
	elif Input.is_action_just_pressed("cancel"):
		SceneChanger.change_scene(Global.Scenes.HOME)
