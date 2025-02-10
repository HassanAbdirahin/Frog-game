extends Area2D

@onready var power_up = $power_up

func _ready():
	get_node("AnimatedSprite2D").play("Idle")

func _on_body_entered(body):
	if body.name == "player":
		Game.playerHP += 3;
		power_up.play()
		Util.saveGame();
		var tween = get_tree().create_tween();
		var tween1 = get_tree().create_tween();
		tween.tween_property(self, "position", position - Vector2(0,35), 0.3);
		tween1.tween_property(self, "modulate:a", 0, 0.2);
		tween.tween_callback(queue_free)
