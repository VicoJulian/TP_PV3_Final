extends PathFollow2D


export (PackedScene) var disparo #creo para instanciar el disparo mediante una escena
var PUEDE_DISPARAR=true


func _ready():
	pass # Replace with function body.

func _process(delta):
	set_offset(get_offset()+80*delta)
	
	
	if (PUEDE_DISPARAR&& Globales.Detener_disparo_mago):
		$Timer.start()
		PUEDE_DISPARAR=false
		var nuevo_disparo=disparo.instance()
		nuevo_disparo.rotate(180)
		nuevo_disparo.global_position=$EnemigoFinal.global_position#paso posicion correcta de disparo
		nuevo_disparo.global_position.x=$EnemigoFinal.global_position.x-20#Corrijo direccion de x para que no choque con el mago
		
		get_tree().get_nodes_in_group("main")[0].add_child(nuevo_disparo)
		nuevo_disparo.velocidad.x=-1*nuevo_disparo.potencia
		
	
	
	
	
	
	
	
	
	
	
	
	
	


func _on_Timer_timeout():
	PUEDE_DISPARAR=true
