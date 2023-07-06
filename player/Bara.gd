extends AnimatedSprite



func _ready():
	pass
	
	
func _input(event):
	
	pass
func _physics_process(delta):
	
	
	if (Input.is_action_pressed("ui_right")):
		set_flip_h(false)
		position.x=8
		rotation_degrees=26.3
		
	if (Input.is_action_pressed("ui_left")):
		set_flip_h(true)
		position.x=-8
		rotation_degrees=-34.4
	
	
	
