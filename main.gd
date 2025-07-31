extends Node2D

var levels = [
	preload("res://levels/level_1.tscn"),
	preload("res://levels/level_2.tscn")
]

var current_level: TileMapLayer
var current_level_id: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	switch_level(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func switch_level(level: int):
	if current_level:
		current_level.queue_free()
	current_level = levels[level].instantiate()
	add_child(current_level)
	current_level_id = level
	

func _input(event):
	if event.is_action_pressed("next_level"):
		var tween = get_tree().create_tween()
		tween.tween_property($CanvasLayer/ColorRect, "color:", Color(Color.BLACK, 1.0), 0.5)
		tween.tween_callback(switch_level.bind((current_level_id + 1) % len(levels)))
		tween.tween_property($CanvasLayer/ColorRect, "color", Color(Color.BLACK, 0.0), 0.5)
