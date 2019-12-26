extends Node2D

# Declare member variables here. Examples:
# var a = 2
var Name = ""
var Side = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_Side(side):
	Side = side
	get_node(Name).set_Side(side)
func set_Name(name):
	Name = name
	
