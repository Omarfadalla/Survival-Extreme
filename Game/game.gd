extends Node2D

@onready var round_timer = $RoundTimer
@onready var Countdown_timer = $RoundCountDown/RoundCountDown
func spawn_mob():
	var new_mob = preload("res://mobs/slime_mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()
	pass # Replace with function body.


func _ready():
	round_timer.start(Global.round_duration)
	pass

func _process(_delta: float) -> void:
	
	var time_left = ceil(round_timer.time_left)
	Countdown_timer.text = "Round " + str(Global.current_round) + " | Time Left : " + str(time_left) 
	pass

func _on_round_timer_timeout() -> void:
	Global.next_round()
	get_tree().call_group("SlimeMob", "queue_free")
	round_timer.start(Global.round_duration)
	pass # Replace with function body.
