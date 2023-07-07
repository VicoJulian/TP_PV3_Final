extends KinematicBody2D

var velocidad=Vector2()
export var potencia=50

export (PackedScene) var bolafuego

func _ready():
	velocidad.x=0
	velocidad.y=0
	
func _physics_process(delta):
	var movimiento=velocidad*delta
	move_and_slide(movimiento)
	if (get_slide_collision(get_slide_count()-1)!=null):
		var obj_colision=get_slide_collision(get_slide_count()-1).collider
		if (obj_colision.is_in_group("Pozo")): 
			queue_free()#destruyo el disparo
	
	
	
	
	
	


















