
extends TextureFrame

func _ready():
	hide()
	set_process_input(true)

func toggle_show():
	var anim = get_node("AnimationPlayer")
	anim.stop_all()
	if is_hidden():
		anim.play("slide_up")
	else:
		anim.play("slide_down")

func _input(ev):
	if ev.is_action("inventory") && ev.is_pressed():
		get_tree().set_input_as_handled()
		toggle_show()
	

func _on_Close_pressed():
	toggle_show()
