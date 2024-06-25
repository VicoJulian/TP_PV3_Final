extends PathFollow2D


export (PackedScene) var disparo #creo para instanciar el disparo mediante una escena
var PUEDE_DISPARAR=true


func _ready():
	pass # Replace with function body.

func _process(delta):
	set_offset(get_offset()+80*delta)
	
	
