extends CharacterBody2D

const SPEED = 300.0
var gameRunning = false;

# Get the gravity from the project settings to be synced with RigidBody nodes.

func _physics_process(_delta):

	if(gameRunning):
		getInput()

	move_and_slide()
	checkBounds()

# Get the input from the user and set the velocity of the player.
func getInput():
	var xdirection = Input.get_axis("ui_left", "ui_right")
	var ydirection = Input.get_axis("ui_up", "ui_down")
	if xdirection:
		velocity.x = xdirection * SPEED
		velocity.y = 0 
	if ydirection:
		velocity.y = ydirection * SPEED
		velocity.x = 0 

# Check if the player is out of bounds and move them to the other side of the screen.
func checkBounds():
	var screen_size = get_viewport_rect().size

	if position.x < 0:
		position.x = screen_size.x 
	if position.y < 0:
		position.y = screen_size.y

	if position.x > screen_size.x:
		position.x =  0
	if position.y > screen_size.y:
		position.y = 0

func _on_countdown_timer_timeout():
	gameRunning = true

