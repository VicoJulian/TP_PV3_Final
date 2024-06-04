extends KinematicBody2D


export (PackedScene) var disparo #creo para instanciar el disparo mediante una escena

export (Vector2) var dis_der
var apuntar_der=true
var PUEDE_DISPARAR=true



#////////////////TRAJE///////////////#
var traje_mago:Color=Color(0.60,0.29,0.63,1.0)
var traje_rojo:Color=Color(0.92,0.02,0.02,1.0)
var barba_mago:Color=Color(0.75,0.8,0.86,1.0)
var barba_azul:Color=Color(0.32,0.50,0.80,1.0)




func _ready():
	dis_der=get_node("Position2D").position
	$Sprite.material.set("shader_param/violeta",traje_mago)
	$Sprite.material.set("shader_param/rojo",traje_mago)
	$Sprite.material.set("shader_param/barba",barba_mago)
	$Sprite.material.set("shader_param/barba_nueva",barba_mago)
	
	
	
func _input(event):
	pass
	
	
func _physics_process(delta):
	
	
	var motion = Vector2()
	if (Input.is_action_pressed("ui_up")):
		motion+=Vector2(0,-0.5)
		
		
	if (Input.is_action_pressed("ui_down")):
		motion+=Vector2(0,+0.5)
		
	if (Input.is_action_pressed("ui_right")):
		motion+=Vector2(+0.5,0)
		get_node("Sprite").set_flip_h(false)
		apuntar_der=true
		get_node("Position2D").position=dis_der
		
		
	if (Input.is_action_pressed("ui_left")):
		motion+=Vector2(-0.5,0)
		get_node("Sprite").set_flip_h(true)
		apuntar_der=false
		get_node("Position2D").position=Vector2(dis_der.x*-1,dis_der.y)
		
		
	if (Input.is_action_just_pressed("disparo") && PUEDE_DISPARAR):
		var nuevo_disparo=disparo.instance()
		nuevo_disparo.global_position=get_node("Position2D").global_position
		get_tree().get_nodes_in_group("main")[0].add_child(nuevo_disparo)
		PUEDE_DISPARAR=false
		$SonidoDispato.play()
		get_node("puede_disparar").start() #inicio el time
		if (apuntar_der):
			nuevo_disparo.velocidad.x=nuevo_disparo.potencia
		else:
			nuevo_disparo.velocidad.x=-nuevo_disparo.potencia
				
				
	if (get_slide_collision(get_slide_count()-1)!=null):
			var obj_colision=get_slide_collision(get_slide_count()-1).collider
			if (obj_colision.is_in_group("pinches")):
				print("PINCHE CONTACTO")
				position=Vector2(72,13)
				Globales.Vidas-=1
				$Muerto.play()
			if (obj_colision.is_in_group("Pozo")):
				print("SE CAYO")
				position=Vector2(72,13)
				Globales.Vidas-=1
				$Muerto.play()
			if (obj_colision.is_in_group("bola_fuego")):
				print("MUERTO POR MAGO")
				obj_colision.queue_free()
				position=Vector2(72,13)
				Globales.Vidas-=1
				$Muerto.play()
			if (obj_colision.is_in_group("enemigo")):
				print("MUERTO")
				position=Vector2(72,13)
				Globales.Vidas-=1
				$Muerto.play()
				
	if (Input.is_action_just_pressed("interactuar")):
		if (get_slide_collision(get_slide_count()-1)!=null):
			var obj_colision=get_slide_collision(get_slide_count()-1).collider
			if (obj_colision.is_in_group("cofre")):
				_on_abrir_cofre()
				
			if (obj_colision.is_in_group("llave")):
				_on_regoger_llave(obj_colision)
				
			if (obj_colision.is_in_group("puerta") && Globales.Puerta_uno_abierta):
				_on_pasar_planta_baja()
				
			if (obj_colision.is_in_group("cofrepb")):
				_on_abrir_cofre_pb()
				
			if (obj_colision.is_in_group("vara")):
				_on_recoger_vara(obj_colision)
				
			if (obj_colision.is_in_group("puertapb")&& Globales.Puerta_dos_abierta):
				print("paso a la torre")
				get_tree().change_scene("res://Torre.tscn")
				
			if (obj_colision.is_in_group("bara_mago_malo")):
				get_tree().change_scene("res://Menues/Fin.tscn")
				print("FIN")
				
	if (Globales.Puerta_dos_abierta):
		_on_cambiar_traje()
		
		
	motion = motion.normalized()*100*0.5
	move_and_slide(motion)
	
	if (Globales.Vidas<1):
		get_tree().change_scene("res://Menues/Muerto.tscn")
	
	

func _on_puede_disparar_timeout(): 
	PUEDE_DISPARAR=true #vuelvo habilitar el dispar despues de x segundos
	
	
func _on_abrir_cofre():
	print("interacuo el player")#obj_colision.queue_free() #destruyo al enemigo
	Globales.Cofre_uno=true
	Globales.Llave_uno=true
	
func _on_regoger_llave(obj_colision):
	Globales.Puerta_uno_abierta=true
	#obj_colision.queue_free()
	obj_colision.position=Vector2(0,0)
	#si destruyo el obj_colision tira un msj de error, la solucion fue sacarlo de la pantalla
	#para que el usario no lo vea y se cree el efecto de recoleccion
	
func _on_pasar_planta_baja():
	print("LLEGO A LA PUERTA")
	get_tree().change_scene("res://PlantaBaja.tscn")
	
	
func _on_abrir_cofre_pb():
	Globales.Cofre_dos=true
	Globales.Vara_poder_verde=true
	print("abrio cofre pb")
	
func _on_recoger_vara(obj_colision):
	print ("recogio vara")
	obj_colision.position=Vector2(-10,-10)
	_on_cambiar_traje()
	Globales.Puerta_dos_abierta=true
	
	
func _on_cambiar_traje():
	$Sprite.material.set("shader_param/rojo",traje_rojo)
	$Sprite.material.set("shader_param/barba_nueva",barba_azul)
