extends Sprite

var Side = ""
# Declare member variables here. Examples:
# var a = 2
onready var Anim = get_node("AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_Frame(frame):
	if Side == "r":
		if frame == "right":
			set_frame(32)
		if frame == "left":
			set_frame(7)
		if frame == "top":
			set_frame(18)
		if frame == "down":
			set_frame(0)
			
	if Side == "l":
		if frame == "right":
			set_frame(9)
		if frame == "left":
			set_frame(7)
		if frame == "top":
			set_frame(28)
		if frame == "down":
			set_frame(6)
		
func set_Side(side):
	Side = side

func stop_anim():
	Anim.stop(true)
	
func set_playback_speed_anim(speed):
	Anim.playback_speed = speed
	
func play_anim(anim):
	print(anim + " " + Side)
	if "r" in anim and Side == "r":
		Anim.play(anim)	
	if "l" in anim and Side == "l":
		Anim.play(anim)	