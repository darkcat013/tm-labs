extends KinematicBody2D
var assigned_worker = null
var valid = true
var nest_radius_node = null
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal essence_changed(num)

onready var world = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("essence_changed", world, "on_essence_changed")

func _physics_process(delta):
	var collecting_area = get_node("Shape_area")
	for bodies in collecting_area.get_overlapping_bodies():
		if bodies.is_in_group("Ally"):
			if bodies.is_in_group("Worker"):
				valid = false
				if(assigned_worker != null):
					assigned_worker.shape_target = assigned_worker.worker_poz.global_position
				world.essence_count -= 1
				world.current_essence += 1
				emit_signal("essence_changed", world.current_essence)
				queue_free()
		if bodies.is_in_group("Player"):
			valid = false
			assigned_worker = null
			world.essence_count -= 1
			world.current_essence += 1
			emit_signal("essence_changed", world.current_essence)
			queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

