extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
var selected = ""
# var b = "text"
var delta_time = 0
onready var inventory = get_node("inventory")
onready var craft = get_node("craft")
onready var herbs = get_node("herbs")
onready var armory = get_node("armory")
onready var scrolls = get_node("scrolls")
onready var settings = get_node("settings")
onready var unkown = get_node("unknown")

onready var actual_inventory = get_node("inventoryOpen")






var menu_item = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	menu_item = [craft, settings, unkown, inventory, herbs, armory, scrolls]
	delta_time = delta_time + delta
	if delta_time > 0.23:
		
		if Input.is_key_pressed(KEY_I):
			handle_menu_selected("inventory")
		if Input.is_key_pressed(KEY_P):
			handle_menu_selected("armory")
		if Input.is_key_pressed(KEY_H):
			handle_menu_selected("herbs")
		if Input.is_key_pressed(KEY_O):
			handle_menu_selected("scrolls")
		if Input.is_key_pressed(KEY_J):
			handle_menu_selected("craft")
		if Input.is_key_pressed(KEY_L):
			handle_menu_selected("unknown")
		if Input.is_key_pressed(KEY_ESCAPE):
			handle_menu_selected("settings")
			
func handle_menu_selected(name):
	if selected == name:
		for i in len(menu_item):
			if menu_item[i].name == name:
				menu_item[i].set_frame(0)
		if get_node(name+"Open") != null:
			get_node(name+"Open").visible = false
		selected = ""
		delta_time = 0
	else:
		if get_node(name+"Open") != null:
			get_node(name+"Open").visible = true
		delta_time = 0				
		for i in len(menu_item):
			if menu_item[i].name == name:
				menu_item[i].set_frame(1)
				selected = name
			else:
				menu_item[i].set_frame(0)
	