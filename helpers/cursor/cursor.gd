
extends Node

var base_cursor
var base_cursor_hover
var alt_cursor
var alt_cursor_hover
var is_alt_cursor
var is_hovering

func _ready():
	base_cursor = load("helpers/cursor/cursor_01.png")
	base_cursor_hover = load("helpers/cursor/cursor_02.png")
	is_alt_cursor = false
	is_hovering = false
	
	#Input.set_custom_mouse_cursor(base_cursor, Vector2(32,32))

func set_alt_cursor(cursor, hover):
	is_alt_cursor = true
	alt_cursor = cursor
	alt_cursor_hover = hover
	if is_hovering:
		hovering()
	else:
		stop_hovering()

func set_base_cursor():
	if is_alt_cursor:
		is_alt_cursor = false
		if is_hovering:
			hovering()
		else:
			stop_hovering()

func hovering():
	if is_alt_cursor:
		Input.set_custom_mouse_cursor(alt_cursor_hover, Vector2(32,32))
	else:
		Input.set_custom_mouse_cursor(base_cursor_hover, Vector2(32,32))

func stop_hovering():
	if is_alt_cursor:
		Input.set_custom_mouse_cursor(alt_cursor, Vector2(32,32))
	else:
		Input.set_custom_mouse_cursor(base_cursor, Vector2(32,32))
