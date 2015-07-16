
extends TextureFrame

func _ready():
	if get_node("..").is_in_group("room"):
		# Is a pause menu
		hide()
		get_node("./Menu/New").hide()
		get_node("./Menu/Continue").show()
		get_node("./Menu/Save").show()
	else:
		preload("res://characters/marian/marian.xscn")

func _on_New_pressed():
	get_node("/root/Music").fade_toggle()
	get_node("/root/tree_switcher").goto_tree("res://rooms/portcullis/portcullis.xscn")

func _on_Continue_pressed():
	pass

func _on_Save_pressed():
	pass

func _on_Load_pressed():
	pass

func _on_About_pressed():
	pass

func _on_Quit_pressed():
	OS.get_main_loop().quit()