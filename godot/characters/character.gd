extends KinematicBody2D

# Declare member variables here. Examples:
var Name = ""
var weapon_1 = ""
var weapon_2 = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var P_status = true;
var new_anim = ""
var anim = ""
var idle_Time = 0
var direction = "down"
var delta_time = 0
var menu_selected = false
var action = false
var movement_Speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	action = false
	delta_time = delta_time + delta
	if Name != "":
		
		if menu_selected:
			P_status = false
			new_anim = "idle"
		else:
			P_status = true
		
		
		if P_status:
			var moving = false
			
			var hori = 0;
			var verti = 0;
			
			#Attack
			if Input.is_key_pressed(KEY_Q) or Input.is_key_pressed(KEY_W):
				if delta_time >= 0.5:
					delta_time = 0
					moving = false
					action = true
					var side = ""
					if Input.is_key_pressed(KEY_Q) and Input.is_key_pressed(KEY_W):
						side = "b"
					else:
						if Input.is_key_pressed(KEY_Q):
							side = "r"
						else:
							side = "l"
					new_anim = side+"_"+"attack_" + direction
			else: 
				action = false
				if Input.is_key_pressed(KEY_RIGHT):
					hori = movement_Speed;
					moving = true
					new_anim = "right"
					direction = "right"
				if Input.is_key_pressed(KEY_LEFT) :
					hori = -movement_Speed;
					moving = true
					new_anim = "left"
					direction = "left"
					
				if Input.is_key_pressed(KEY_UP) :
					verti = -movement_Speed;
					moving = true		
					new_anim = "top"
					direction = "top"
					
				if Input.is_key_pressed(KEY_DOWN) :
					verti = movement_Speed
					moving = true
					new_anim = "down"
					direction = "down"
					
			
			
			if moving == false and action == false:
				idle_Time = idle_Time + delta
				if idle_Time > 4:
					new_anim = "character_Idle"
					
				if new_anim == "right":
					get_node(Name).set_Frame("right")
					get_node("w1/"+weapon_1).set_Frame("right")
					get_node("w2/"+weapon_2).set_Frame("right")
					new_anim = ""
					
				if new_anim == "left":
					get_node(Name).set_Frame("left")
					get_node("w1/"+weapon_1).set_Frame("left")
					get_node("w2/"+weapon_2).set_Frame("left")
					new_anim = ""
					
				if new_anim == "top":
					get_node(Name).set_Frame("top")
					get_node("w1/"+weapon_1).set_Frame("top")
					get_node("w2/"+weapon_2).set_Frame("top")
					new_anim = ""
					
				if new_anim == "down":
					get_node(Name).set_Frame("down")					
					get_node("w1/"+weapon_1).set_Frame("down")
					get_node("w2/"+weapon_2).set_Frame("down")
					new_anim = ""
			else:
				idle_Time = 0
				
				
			move_and_slide(Vector2(hori,verti))
			
			for i in get_slide_count():
				var collision = get_slide_collision(i)
				if collision.collider.name == "exit" and Input.is_key_pressed(KEY_E):
					position.x = 0
					position.y = 0
					
		if new_anim != anim:
			anim = new_anim
			if anim == "":
				get_node(Name).stop_anim()
			else:
				if anim != "idle":
					get_node(Name).set_playback_speed_anim(movement_Speed/50)
					get_node("w1/"+weapon_1).set_playback_speed_anim(movement_Speed/50)
					get_node("w2/"+weapon_2).set_playback_speed_anim(movement_Speed/50)
					
				else:
					get_node(Name).set_playback_speed_anim(1)
					get_node("w1/"+weapon_1).set_playback_speed_anim(1)
					get_node("w2/"+weapon_2).set_playback_speed_anim(1)
				get_node(Name).play_anim(anim)
				get_node("w1/"+weapon_1).play_anim(anim)
				get_node("w2/"+weapon_2).play_anim(anim)
					
				
		else:
			if action:
				get_node(Name).play_anim(new_anim)
				get_node("w1/"+weapon_1).play_anim(new_anim)
				get_node("w2/"+weapon_2).play_anim(new_anim)
	


func set_char(name):
	Name = name
	
func set_weapon1(w1):
	weapon_1 = w1
func set_weapon2(w2):
	weapon_2 = w2
func set_Menu_Selected(status):
	menu_selected = status