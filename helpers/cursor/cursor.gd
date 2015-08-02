
extends AnimatedSprite

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_process(true)

func hovering():
	set_frame(1)

func stop_hovering():
	set_frame(0)

func _process(delta):
	set_pos( get_viewport().get_mouse_pos() )
