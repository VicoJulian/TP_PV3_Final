extends KinematicBody2D


var stop=true
export var posicion_vara= Vector2(65,85)
var unicavez=true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	if(Globales.Vara_poder_verde&&stop):
		print("Vara habilitada")
		position=posicion_vara
		stop=false
		if (unicavez):
			$SonidoRecoleccion.play()
			unicavez=false
	
