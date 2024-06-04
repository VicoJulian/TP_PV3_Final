extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Reiniciar_pressed():
	Globales.Cofre_uno=false
	Globales.Cofre_dos=false
	Globales.Cofre_tres=false
	Globales.Traje_uno=false
	Globales.Llave_uno=false
	Globales.Puerta_uno_abierta=false
	Globales.Puerta_dos_abierta=false
	Globales.Vara_poder_verde=false
	Globales.Detener_disparo_mago=true
	Globales.Vidas=3
	get_tree().change_scene("res://Sotano.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Menu_pressed():
	get_tree().change_scene("res://Menues/MenuInicio.tscn")
