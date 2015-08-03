
extends StreamPlayer

var menu_music
var game_music
var fade_to_music
var track
var game_pos

const MENU_TRACK = 0
const GAME_TRACK = 1

func _ready():
	menu_music = "res://audio/music/thatched_villagers.ogg"
	game_music = "res://audio/music/pippin_the_hunchback.ogg"
	fade_to_music = ""
	track = MENU_TRACK
	game_pos = get_pos()

func fade_toggle():
	if track == MENU_TRACK:
		track = GAME_TRACK
		_fade_to(game_music)
	else:
		track = MENU_TRACK
		game_pos = get_pos()
		_fade_to(menu_music)

func toggle_track():
	if track == MENU_TRACK:
		track = GAME_TRACK
		_switch_to(game_music)
	else:
		track = MENU_TRACK
		game_pos = get_pos()
		_switch_to(menu_music)

func fade_new_music(new_track):
	_set_game_music(new_track)
	if track == GAME_TRACK:
		_fade_to(new_track)

func switch_new_music(new_track):
	_set_game_music(new_track)
	if track == GAME_TRACK:
		_switch_to(new_track)

func _fade_to(new_track):
	get_child(0).stop_all()
	get_child(0).play("fade_to")
	fade_to_music = new_track

func _switch_to(new_track):
	get_child(0).stop_all()
	set_stream( load(new_track) )
	set_volume(1)
	if track == GAME_TRACK:
		seek_pos(game_pos)
	play()

func _set_game_music(track):
	game_music = track

func _switch_faded():
	get_child(0).stop_all()
	_switch_to(fade_to_music)
