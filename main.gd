extends Node2D


export(String, DIR) var data_dir


var RNGManager = load("res://RNGManager.cs")
var rng_managers = {}

func _ready():
	find_sources(data_dir)


func find_sources(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir():
				create_manager(path, file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access "+path)


func create_manager(path, file_name):
	var file = File.new()
	file.open(path+"/"+file_name, File.READ)
	var content = file.get_as_text()
	var name = file_name.get_basename().capitalize()
	var manager = RNGManager.new()
	rng_managers[name] = manager
	manager.Load(content)
