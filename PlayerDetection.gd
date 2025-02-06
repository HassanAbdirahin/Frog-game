extends Area2D

var player : Node2D

func _ready():
	# Connect the body_entered signal
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	# Check if the body is the player
	if body.name == "Player":
		player = body

		# Calculate the direction based on positions
		var direction = player.position - self.position
		if direction.x > 0:
			print("Player is to the right")
		else:
			print("Player is to the left")
