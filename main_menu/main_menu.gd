
extends TextureFrame

var pause_button_pressed

func _ready():
	if get_node("..").is_in_group("room"):
		# Is a pause menu
		hide()
		get_node("./Menu/New").hide()
		get_node("./Menu/Continue").show()
		get_node("./Menu/Save").show()
		
		set_process_input(true)
	else:
		preload("res://characters/marian/marian.xscn")

func _on_New_pressed():
	get_node("/root/Music").fade_toggle()
	get_node("/root/tree_switcher").goto_tree("res://rooms/portcullis/portcullis.xscn")

func _on_Continue_pressed():
	pause_toggle()

func _on_Save_pressed():
	pass

func _on_Load_pressed():
	pass

func _on_About_pressed():
	pass

func _on_Quit_pressed():
	OS.get_main_loop().quit()

func pause_toggle():
	if get_tree().is_paused():
		get_tree().set_pause(false)
		hide()
	else:
		get_tree().set_pause(true)
		show()
	get_node("/root/Music").fade_toggle()

func _input(ev):
	if ev.is_action("pause") && ev.is_pressed():
		get_tree().set_input_as_handled()
		pause_toggle()
