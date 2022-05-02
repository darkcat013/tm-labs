extends Node2D
var spawn_count = 1

func _ready():
	randomize()

var pest_nest = preload("res://Objects/Structures/Pest_Deepnest/Pest_Deepnest.tscn")

func _on_SpawnTimer_timeout():
	for i in int(spawn_count):
		var nest = pest_nest.instance()
		add_child(nest)
	
		var spawn_loc = $ExpandingBack/Path2D/PathFollow2D
		spawn_loc.offset = randi()
	
		nest.position = spawn_loc.global_position
