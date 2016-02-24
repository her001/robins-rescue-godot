
extends Node

onready var base_cursor = load("helpers/cursor/cursor_01.png")
onready var base_cursor_hover = load("helpers/cursor/cursor_02.png")
var alt_cursor
var alt_cursor_hover
var is_alt_cursor = false
var is_hovering = false

func _ready():
	#Input.set_custom_mouse_cursor(base_cursor, Vector2(32,32))
	pass

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
