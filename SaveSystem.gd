extends Node

var save_path = "user://save.dat"

func _unhandled_input(event):
	if event.is_action_pressed("save"):
		var save_data = {
			#"player_location.x" : 0
			#,"player_location.y" : 0
			"score" : 0
			,"scene" : 0
		}
		#var player = get_node("/root/Game/Player_Container/Player")
		var score = get_node("/root/Global")
		#var scene = get_tree().current_scene()
		#save_data["player_location.x"] = player.location.x
		#save_data["player_location.y"] = player.location.y
		save_data["score"] = Global.score
		#save data["scene"] = Global.scene
		var file = File.new()
		var error =file.open(save_path, File.WRITE)
		if error == OK:
			file.store_var(save_data)
			print("Saved Game!")
			print(OS.get_user_data_dir())
			file.close()
	if event.is_action_pressed("load"):
		var file = File.new()
		if file.file_exists(save_path):
			var error = file.open(save_path, File.READ)
			if error == OK:
				var save_data = file.get_var()
				file.close()
				#var player = get_node("/root/Game/Player_Container/Player")
				var score = get_node("/root/Global")
				#player.location.x = save_data["player_location.x"]
				#player.location.y = save_data["player_location.y"]
				Global.score = save_data["score"]
