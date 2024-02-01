extends Area2D

signal collected


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(_body:Node2D):
	emit_signal("collected")
	prints("collected")
	hide()
	queue_free()

