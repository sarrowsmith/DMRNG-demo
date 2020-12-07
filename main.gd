extends Node2D


export(String, DIR) var data_dir
var RNGManager = load("res://RNGManager.cs")
var rng_managers = {}

onready var control_panel = get_node("ControlPanel")


func _ready():
	find_sources(data_dir)
	control_panel.add_sources(rng_managers.keys())


func find_sources(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".txt"):
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


func _on_ControlPanel_generate(source):
	print(rng_managers[source].GetName())
