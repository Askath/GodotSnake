extends Node2D
var appleScene: PackedScene = preload("res://lvlone/apple.tscn")

# Called when the node enters the scene tree for the first time.
#
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if($CountdownTimer.time_left > 0):
		$CountdownLabel.text = str($CountdownTimer.time_left).pad_decimals(0) 

		if($CountdownTimer.time_left < 1):
			$CountdownLabel.text = "Lets Go!"

func _on_apple_spawn_timeout():
	var instance = appleScene.instantiate()
	instance.collected.connect(apple_collected)
	get_tree().get_root().add_child(instance)
	var rng = RandomNumberGenerator.new()
	var size = get_viewport_rect().size
	instance.position.x = rng.randf_range(20, size.x)
	instance.position.y = rng.randf_range(20, size.y)

func _on_countdown_timer_timeout():
	$CountdownTimer.stop()
	$CountdownLabel.hide()
	$CountdownLabel.queue_free()
	$AppleSpawn.start()

func apple_collected():
	var score = $ScoreLabel.text.to_int()
	score += 1
	$ScoreLabel.text = str(score)
