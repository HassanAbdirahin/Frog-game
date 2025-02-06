extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player;

func _physics_process(delta):
	# gravity
	velocity.y += gravity * delta
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "player":
		# Ensure player is correctly detected
		player = get_node("../../Player/player")

		# Check if player is to the left or right based on global_position
		if player.global_position.x > global_position.x:
			print("right")
		else:
			print("left")
