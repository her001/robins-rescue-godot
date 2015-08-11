
extends TextureFrame

var using_item
var active_item

func _ready():
	hide()
	using_item = false
	active_item = ""
	
	set_process_input(true)

func add_item():
	pass

func toggle_show():
	var anim = get_node("AnimationPlayer")
	anim.stop_all()
	if is_hidden():
		anim.play("slide_up")
	else:
		anim.play("slide_down")

func _input(ev):
	if ev.is_action("inventory") && ev.is_pressed() && not using_item:
		get_tree().set_input_as_handled()
		toggle_show()
	elif ev.is_action("inventory") && ev.is_pressed() && using_item:
		get_tree().set_input_as_handled()
		get_node("../Cursor").set_base_cursor()

func _on_Close_pressed():
	toggle_show()
	get_node("../Cursor").stop_hovering()

func _on_button_mouse_enter():
	get_node("../Cursor").hovering()

func _on_button_mouse_exit():
	get_node("../Cursor").stop_hovering()
