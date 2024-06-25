extends KinematicBody2D



#onready var disparo= preload ("res://disparo/BolasFuego.tscn")
export (PackedScene) var disparo #creo para instanciar el disparo mediante una escena




# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	pass

	
	

func _on_Timer_timeout():
	var disparo_nuevo=disparo.instance()
	disparo_nuevo.global_position=$Position2D.global_position
	get_tree().get_nodes_in_group("main")[0].add_child(disparo_nuevo)
	disparo_nuevo.velocidad.x=-1*disparo_nuevo.potencia
	 
	
