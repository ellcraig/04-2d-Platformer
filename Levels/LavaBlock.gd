extends KinematicBody2D

export var s = -50
onready var HUD = get_node("/root/Game/HUD")

func die():
	get_tree().reload_current_scene()
	HUD.update_score(s)


func _on_Area2D_body_entered(body):
	die()
