
extends Node

var current_tree
var root

func _ready():
	root = get_tree().get_root()
	current_tree = root.get_child( root.get_child_count() - 1 )

func goto_tree(tree):
	var new_tree = ResourceLoader.load(tree).instance()
	current_tree.queue_free()
	current_tree = new_tree
	root.add_child(current_tree)