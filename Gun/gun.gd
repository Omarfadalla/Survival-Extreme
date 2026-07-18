extends Area2D

func _physics_process(_delta: float) -> void:
	
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
	pass
	
func Shoot():
	const BULLET = preload("res://bullet/bullet.tscn")
	var new_bullet  = BULLET.instantiate()
	new_bullet.global_position = %ShootPoint.global_position
	%ShootPoint.add_child(new_bullet)
