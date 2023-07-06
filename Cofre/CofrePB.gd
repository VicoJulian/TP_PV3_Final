extends KinematicBody2D


var abriocofre=false
var stop=true

func _ready():
	pass
		
	
	
	
func _process(delta):
	
	abriocofre=Globales.Cofre_dos
	
	
	if(abriocofre && stop ):
		$AnimCofre.play("Abierto")
		print("Se Abrio el cofre")
		stop=false
