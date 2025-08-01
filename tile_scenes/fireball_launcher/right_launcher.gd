extends Node2D

var right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	var launcher = $FireballLauncher
	launcher.flip(right)
	add_child(launcher)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
