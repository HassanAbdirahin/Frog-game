extends Area2D

func _ready():
	get_node("AnimatedSprite2D").play("Idle")

func _on_body_entered(body):
	if body.name == "player":
		Game.playerHP += 3;
		Util.saveGame();
		queue_free();
