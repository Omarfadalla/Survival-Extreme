extends Node

var current_round = 1
var round_duration = 30

var mob_health_multiplier = 1
var mob_damage_multiplier = 1

signal round_complete

func next_round():
	current_round +=1
	mob_health_multiplier += 0.3
	mob_damage_multiplier += 0.3
	
	emit_signal("round_complete")
	
