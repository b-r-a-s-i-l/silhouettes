extends KinematicBody2D

export (int) var speed = 600
export (int) var jump_speed = -1200
export (int) var push_strength = 5
export (int) var gravity = 4000
export (float, 0, 1.0) var friction = 1.0
export (float, 0, 1.0) var acceleration = 0.25
export (Color) var color = Color.black

var velocity = Vector2.ZERO

func _ready():
	modulate = color
	z_index = 1

func _physics_process(delta):
	get_input(delta)
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)

func get_input(delta):
	var dir = 0
	if Input.is_action_pressed("move_right"):
		dir += 1
		$AnimatedSprite.flip_h = false
		$"Right".enabled = true
		if $"Right".is_colliding():
			var object = $"Right".get_collider()
			object.move_and_slide(Vector2(30,0) * push_strength * delta)
	elif Input.is_action_pressed("move_left"):
		dir -= 1
		$AnimatedSprite.flip_h = true
		$"Left".enabled = true
		if $"Left".is_colliding():
			var object = $"Left".get_collider()
			object.move_and_slide(Vector2(-30,0) * push_strength * delta)
		
	if dir != 0:
		$AnimatedSprite.play("walking")
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		$AnimatedSprite.play("idle")
		$"Right".enabled = false
		$"Left".enabled = false
		velocity.x = lerp(velocity.x, 0, friction)
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			$AnimatedSprite.play("jump")
			velocity.y = jump_speed
		else:
			$AnimatedSprite.play("idle")
	if Input.is_action_just_pressed("rotate"):
		Global.emit_signal("LAYER_ROTATE")

