extends Control

onready var global = get_node("/root/Global")

func _ready():
	update_score(0)


func update_score(s):
	global.score += s
	$Score.text = "Your Score: " + str(global.score)

