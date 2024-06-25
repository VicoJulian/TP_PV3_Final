extends KinematicBody2D

var velocidad=Vector2()
export var potencia=100
# Called when the node enters the scene tree for the first time.

#////////////////TRAJE///////////////#
var disparo_mago:Color=Color(0.32,0.64,0.64,1.0)
var disparo_rojo:Color=Color(0.74,0.13,0.13,1.0)

func _ready():
	velocidad.x=0
	velocidad.y=0
	$AnimatedSprite.material.set("shader_param/azul",disparo_mago)
	$AnimatedSprite.material.set("shader_param/rojo",disparo_mago)
	

func _physics_process(delta):
	var movimiento=velocidad*delta
	
	if get_slide_count() > 0:
		var collision = get_slide_collision(get_slide_count() - 1)
		if collision:
			var obj_colision = collision.collider
			if (obj_colision.is_in_group("enemigo")):
				obj_colision.queue_free() #destruyo al enemigo
				queue_free()#destruyo el disparo
			if (obj_colision.is_in_group("colision")):
					queue_free()#destruyo el disparo
			if (obj_colision.is_in_group("cofre")):
					queue_free()#destruyo el disparo
			if (obj_colision.is_in_group("cofrepb")):
					queue_free()#destruyo el disparo
			if (obj_colision.is_in_group("Pozo")):
				queue_free()#destruyo el disparo
			if (obj_colision.is_in_group("pinches")):
				queue_free()#destruyo el disparo
			if (obj_colision.is_in_group("bola_fuego")):
				queue_free()#destruyo el disparo
			if (obj_colision.is_in_group("bara_mago_malo")):
				queue_free()#destruyo el disparo
			if (obj_colision.is_in_group("mago_final")):
				Globales.Detener_disparo_mago=false
				obj_colision.queue_free()#destruyo el disparo
				queue_free()#destruyo el disparo
		
	if (Globales.Vara_poder_verde):
		$AnimatedSprite.material.set("shader_param/rojo",disparo_rojo)
		
	move_and_slide(movimiento)

