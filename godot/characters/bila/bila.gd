extends Sprite

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
	if frame == "right":
		set_frame(9)
	if frame == "left":
		set_frame(7)
	if frame == "top":
		set_frame(4)
	if frame == "down":
		set_frame(0)
		
func stop_anim():
	Anim.stop(true)
	
func set_playback_speed_anim(speed):
	Anim.playback_speed = speed
	
func play_anim(anim):
		
	Anim.play(anim)