extends Node2D

#Main Objects
onready var character1 = load("res://characters/character.tscn").instance()
onready var weapon1 = load("res://items/weapon.tscn").instance()
onready var weapon2 = load("res://items/weapon.tscn").instance()

#Characters
onready var bili = load("res://characters/bili/bili.tscn").instance()
onready var bila = load("res://characters/bila/bila.tscn").instance()

#Weapons
onready var simple_wood = load("res://items/001_simple_wood/001_simple_wood.tscn")

#GUI

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(character1)
	character1.add_child(bila)
	character1.set_char("bila")
	character1.set_weapon1("001_simple_wood")
	character1.set_weapon2("001_simple_wood")
	
	weapon1.set_name("w1")
	weapon1.add_child(simple_wood.instance())	
	weapon1.set_Name("001_simple_wood")
	weapon1.set_Side("r")
	
	weapon2.set_name("w2")	
	weapon2.add_child(simple_wood.instance())	
	weapon2.set_Name("001_simple_wood")
	weapon2.set_Side("l")
	character1.add_child(weapon1)
	character1.add_child(weapon2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_menu_selected(status):
	character1.set_Menu_Selected(status)