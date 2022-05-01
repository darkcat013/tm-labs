extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var core_hitbox = get_node("Core_hitbox")
	for bodies in core_hitbox.get_overlapping_bodies():
		if bodies.is_in_group("Enemy"):
			take_dmg_from_pest(delta)
	
func take_dmg_from_pest(delta):
	$TextureProgress.value = $TextureProgress.value - 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
