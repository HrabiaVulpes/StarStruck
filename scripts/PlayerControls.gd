extends CharacterBody2D

@onready var timer = $StunTime

var speed = 400

func move():
	var direction = Vector2.ZERO
	direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	if timer.is_stopped():
		velocity = direction * speed
	pass

func _physics_process(delta):
	move()
	if move_and_slide() and timer.is_stopped() and visible:
		for i in get_slide_collision_count():
			var collider = get_slide_collision(i)
			if collider.get_collider() is RigidBody2D:
				var asteroidSpeed = collider.get_collider_velocity()
				var asteroidMass = collider.get_collider().mass
				var hp = get_parent().get_node("ProgressBar")
				hp.value -= asteroidMass*10
				if hp.value > 0 :
					collider.get_collider().apply_force(velocity*2)
					timer.wait_time = 0.3
					timer.start()
					create_tween().tween_property(self, "position", position + asteroidSpeed*0.5*asteroidMass, 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		pass
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	var goal = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y-150)
	timer.wait_time = 0.7
	timer.start()
	create_tween().tween_property(self, "position", goal, 0.7).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	pass # Replace with function body.
