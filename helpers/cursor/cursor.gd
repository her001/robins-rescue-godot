
extends Sprite

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_process(true)

func _process(delta):
	set_pos( get_viewport().get_mouse_pos() )
