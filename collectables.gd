extends Node2D


var coins = preload("res://coins/coins.tscn");

func _on_timer_timeout():
	var coinsTemp = coins.instantiate();
	coinsTemp.global_position = Vector2(128, 384)
	add_child(coinsTemp);
	
