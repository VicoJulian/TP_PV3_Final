extends StaticBody2D


export (PackedScene) var disparo #creo para instanciar el disparo mediante una escena
var PUEDE_DISPARAR=true
var velocidad=Vector2()
export var potencia=100

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	
	if (PUEDE_DISPARAR):
		PUEDE_DISPARAR=false
		$Timer.start()
		var nuevo_disparo=disparo.instance()
		nuevo_disparo.global_position=Vector2(15,45)
		get_tree().get_nodes_in_group("main")[0].add_child(nuevo_disparo)
		nuevo_disparo.velocidad.x=nuevo_disparo.potencia
		var nuevo_disparo2=disparo.instance()
		nuevo_disparo2.global_position=Vector2(15,72)
		get_tree().get_nodes_in_group("main")[0].add_child(nuevo_disparo2)
		nuevo_disparo2.velocidad.x=nuevo_disparo2.potencia
		var nuevo_disparo3=disparo.instance()
		nuevo_disparo3.global_position=Vector2(15,135)
		get_tree().get_nodes_in_group("main")[0].add_child(nuevo_disparo3)
		nuevo_disparo3.velocidad.x=nuevo_disparo3.potencia
		var nuevo_disparo4=disparo.instance()
		nuevo_disparo4.global_position=Vector2(15,150)
		get_tree().get_nodes_in_group("main")[0].add_child(nuevo_disparo4)
		nuevo_disparo4.velocidad.x=nuevo_disparo4.potencia
		var nuevo_disparo5=disparo.instance()
		nuevo_disparo5.global_position=Vector2(15,215)
		get_tree().get_nodes_in_group("main")[0].add_child(nuevo_disparo5)
		nuevo_disparo5.velocidad.x=nuevo_disparo5.potencia
		





func _on_Timer_timeout():
	PUEDE_DISPARAR=true
