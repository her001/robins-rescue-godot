
extends AnimatedSprite

var base_cursor
var is_alt_cursor

func _ready():
	base_cursor = load("res://helpers/cursor/standard_cursor.xml")
	is_alt_cursor = false
	
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func set_alt_cursor(sprite_frames):
	if not is_alt_cursor:
		set_sprite_frames(load(sprite_frames))
		is_alt_cursor = true

func set_base_cursor():
	if is_alt_cursor:
		set_sprite_frames(base_cursor)
		is_alt_cursor = false

func hovering():
	set_frame(1)

func stop_hovering():
	set_frame(0)
