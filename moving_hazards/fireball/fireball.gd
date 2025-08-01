extends AnimatedSprite2D

var right: bool = true
const SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")

func flip(t_right):
	right = t_right
	if right:
		flip_h = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = 1 if right else -1
	position.x += dir * delta * SPEED


func _on_area_2d_body_entered(body):
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
