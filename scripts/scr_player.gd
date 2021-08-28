extends KinematicBody


const move_spd = 30
var movement = Vector3()
const jump_force = 30
const gravity = 0.98
const max_fall_spd = 30

var h_look_sens = 0.5
var v_look_sens = 0.5

var forward_key = KEY_W;
var left_key = KEY_A;
var right_key = KEY_D;
var backwards_key = KEY_S;

onready var cam = $"cam base"

var y_velo = 0

func _input(event):
	var just_pressed = event.is_pressed() && !event.is_echo();
	if event is InputEventMouseMotion && global.loading == false:
		cam.rotation_degrees.x -= event.relative.y * v_look_sens
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -90, 0)
		cam.rotation_degrees.y -= event.relative.x * h_look_sens

func _process(delta):
	if OS.get_latin_keyboard_variant() == "AZERTY":
		forward_key = KEY_Z
		left_key = KEY_Q
	else:
		forward_key = KEY_W
		left_key = KEY_A
	movement = Vector3(0, 0, 0)
	if global.loading == false:
		if Input.is_key_pressed(right_key):
			movement.x += 1
		if Input.is_key_pressed(left_key):
			movement.x -= 1
		if Input.is_key_pressed(forward_key):
			movement.z -= 1
		if Input.is_key_pressed(backwards_key):
			movement.z += 1
	movement = movement.normalized()
	movement = movement.rotated(Vector3(0, 1, 0), rotation.y)
	movement.y = y_velo
	move_and_slide(movement * move_spd, Vector3(0,1,0))
	var grounded = is_on_floor()
	if grounded and y_velo <= 0:
		y_velo = -0.1
	if y_velo < -max_fall_spd:
		y_velo = -max_fall_spd
	y_velo -= gravity
