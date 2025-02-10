extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player;
var chase = false;
var SPEED = 150;

@onready var player_hurt = $sfx/player_hurt
@onready var death_sfx = $sfx/death

func _ready():
	get_node("AnimatedSprite2D").play("idle");

func _physics_process(delta):
	# gravity
	velocity.y += gravity * delta
	
	if chase == true:
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("run");
		player = get_node("../../Player/player");
		var direction = (player.global_position - self.global_position).normalized();
		if direction.x > 0:
				get_node("AnimatedSprite2D").flip_h = true;
				velocity.x = direction.x * SPEED;
		else:
			velocity.x = direction.x * SPEED;
			get_node("AnimatedSprite2D").flip_h = false;
	else:
		velocity.x = 0;
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("idle");
	
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "player":
		chase = true;
	

func _on_player_detection_body_exited(body):
	if body.name == "player":
		chase = false;
		


func _on_player_detection_2_body_entered(body):
	if body.name == "player":
		death();

func _on_player_collision_body_entered(body):
	if body.name == "player":
		Game.playerHP -= 3;
		body.get_node("AnimatedSprite2D").play("damage")
		player_hurt.play()
		death();

func death():
		Game.coins += 5;
		Util.saveGame();
		chase = false;
		get_node("AnimatedSprite2D").play("death")
		player_hurt.play()
		death_sfx.play()
		await get_node("AnimatedSprite2D").animation_finished;;
		self.queue_free();
