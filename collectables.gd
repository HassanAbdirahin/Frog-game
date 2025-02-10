extends Node2D


var coins = preload("res://coins/coins.tscn");
var HP = preload("res://heart.tscn")

func _on_timer_timeout():
	var coinsTemp = coins.instantiate();
	var HPTemp = HP.instantiate()
	var rng = RandomNumberGenerator.new();
	var randInt = rng.randi_range(96, 2960)
	var randInt2 = rng.randi_range(104, 2960)
	coinsTemp.global_position = Vector2(randInt, 384)
	HPTemp.global_position = Vector2(randInt2, 364)
	add_child(coinsTemp);
	add_child(HPTemp)
	
