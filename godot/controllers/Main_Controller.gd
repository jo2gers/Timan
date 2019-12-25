extends Node2D

#Main Objects
onready var character1 = load("res://characters/character.tscn").instance()

#Characters
onready var bili = load("res://characters/bili/bili.tscn").instance()

#GUI

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(character1)
	character1.add_child(bili)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
