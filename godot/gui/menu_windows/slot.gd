extends Panel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var selected = false
onready var sprite = get_node("Sprite") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected:
		sprite.set_frame(0)
	else:
		sprite.set_frame(1)
		

func set_selected(status):
	selected = status