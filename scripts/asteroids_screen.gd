extends Node2D

var asteroidScene
@onready var timer = $Spawner
var asteroids = []

# Called when the node enters the scene tree for the first time.
func _ready():
	asteroidScene = load("res://scenes/asteroid.tscn")
	pass # Replace with function body.

func spawnAsteroid():
	var scene_instance = asteroidScene.instantiate()
	scene_instance.set_name("Asteroid")
	asteroids.append(scene_instance)
	add_child(scene_instance)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.is_stopped():
		spawnAsteroid()
		spawnAsteroid()
		spawnAsteroid()
		timer.wait_time = 1
		timer.start()
	pass


func _on_progress_bar_value_changed(value):
	if value <= 0 :
		get_tree().change_scene_to_file("res://scenes/game_menu.tscn")
		pass
	pass # Replace with function body.
