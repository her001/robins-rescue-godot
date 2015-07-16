
extends StreamPlayer

var menu_music
var game_music
var fade_to_music
var stream

func _ready():
	menu_music = "res://audio/music/thatched_villagers.ogg"
	game_music = "res://audio/music/pippin_the_hunchback.ogg"
	fade_to_music = ""
	stream = get_stream()

func fade_toggle():
	if stream.get_path()==menu_music:
		fade_to(game_music)
	else:
		fade_to(menu_music)

func fade_to(new_track):
	get_child(0).play("fade to")
	fade_to_music = new_track

func fade_out():
	get_child(0).play("fade out")

func switch_to(new_track):
	set_stream( load(new_track) )
	set_volume(1)
	play()
	stream = get_stream()

func set_game_music(track):
	game_music = track

func _switch_faded():
	get_child(0).stop_all()
	switch_to(fade_to_music)