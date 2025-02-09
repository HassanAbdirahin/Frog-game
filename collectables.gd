extends Node2D


var coins = preload("res://coins/coins.tscn");

func _on_timer_timeout():
	var coinsTemp = coins.instantiate();
	var rng = RandomNumberGenerator.new();
	var randInt = rng.randi_range(96, 2960)
	coinsTemp.global_position = Vector2(randInt, 384)
	add_child(coinsTemp);
	
