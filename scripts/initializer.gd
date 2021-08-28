extends Node

onready var viewport = get_viewport()

var minimum_size = Vector2(1920, 1080)

func _ready():
	viewport.connect("size_changed", self, "window_resize")
	window_resize()

func window_resize():
	var current_size = OS.get_window_size()

	var scale_factor = minimum_size.y/current_size.y
	var new_size = Vector2(current_size.x*scale_factor, minimum_size.y)

	if new_size.y < minimum_size.y:
		scale_factor = minimum_size.y/new_size.y
		new_size = Vector2(new_size.x*scale_factor, minimum_size.y)
	if new_size.x < minimum_size.x:
		scale_factor = minimum_size.x/new_size.x
		new_size = Vector2(minimum_size.x, new_size.y*scale_factor)

	viewport.set_size_override(true, new_size)
	
func _input(event):
	var just_pressed = event.is_pressed() && !event.is_echo();
	if Input.is_key_pressed(KEY_F4) && just_pressed:
		if OS.window_fullscreen == true:
			OS.window_fullscreen = false;
		else: OS.window_fullscreen = true;
	if Input.is_key_pressed(KEY_ESCAPE) && just_pressed:
		get_tree().quit();

func _process(_delta):
	if get_tree().current_scene.name == "Za warudo":
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
