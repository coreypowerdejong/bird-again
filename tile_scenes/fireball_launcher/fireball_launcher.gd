extends AnimatedSprite2D

const FIREBALL = preload("res://moving_hazards/fireball/fireball.tscn")

var right: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func flip(t_right: bool):
	right = t_right
	if right:
		flip_h = true

func fire():
	var fireball = FIREBALL.instantiate()
	add_child(fireball)
	fireball.flip(right)

func _on_timer_timeout():
	var tween = get_tree().create_tween()
	tween.tween_callback(play.bind("fire"))
	tween.tween_interval(0.2)
	tween.tween_callback(fire)
	tween.tween_interval(0.3)
	tween.tween_callback(play.bind("default"))
