extends Node2D

enum ENUMERATION {Item0, Item1, Item2}


func _ready():
	$RegularPolygon.frozen = false
#
#
#func _ready():
#	for e in ENUMERATION:
#		print(str(e))
#	var sd = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)
#	dir_contents(sd)
#
#
#func dir_contents(path):
#	var dir = Directory.new()
#	if dir.open(path) == OK:
#		dir.list_dir_begin()
#		var file_name = dir.get_next()
#		while file_name != "":
#			if dir.current_is_dir():
#				print("Found directory: " + file_name)
#			else:
#				print("Found file: " + file_name)
#			file_name = dir.get_next()
#	else:
#		print("An error occurred when trying to access the path.")
#

