extends KinematicBody2D


var stop=true
export var posicion_llave= Vector2(65,60)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	if(Globales.Llave_uno&&stop):
		print("Llave habilitada")
		position=posicion_llave
		stop=false
	
