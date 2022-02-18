extends KinematicBody2D

var speed = 200
var gravity = 50
var jump = -750
var moveVector = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"): moveVector.x = speed
	elif Input.is_action_pressed("ui_left"): moveVector.x = -speed
	else: moveVector.x = 0
	if is_on_floor():
		if Input.is_action_pressed("ui_up"): moveVector.y = jump
		else: moveVector.y = 0
	if not is_on_floor(): moveVector.y += gravity
	move_and_slide(moveVector, Vector2.UP)
