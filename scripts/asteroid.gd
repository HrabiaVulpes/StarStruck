extends RigidBody2D

var movement

# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	var screenWidth = get_viewport_rect().size.x
	mass = rng.randf_range(0.1, 1.0)
	position = Vector2(rng.randi_range(1, screenWidth), -100)
	movement = Vector2.DOWN * rng.randf_range(0.0, 500.0) + Vector2.LEFT * rng.randf_range(-200.0, 200.0)
	apply_impulse(movement)
	pass # Replace with function body.



func _on_visible_on_screen_notifier_2d_screen_exited():
	get_parent().remove_child(self)
	pass # Replace with function body.
