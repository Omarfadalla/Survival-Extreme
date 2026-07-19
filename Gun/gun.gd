extends Area2D

const BULLET = preload("res://bullet/bullet.tscn")

func _physics_process(_delta: float) -> void:
	
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
	pass

func Shoot():
	var player = get_node("/root/Game/Player")
	if player.has_shotgun:
		var count = 2
		
		if player.shotgun_count ==2:
			count = 4
		if player.triple_weapons_active:
			count = 6
		for i in range(count):
			var new_bullet  = BULLET.instantiate()
			new_bullet.global_position = %ShootPoint.global_position
			new_bullet.global_rotation = %ShootPoint.global_rotation
			%ShootPoint.add_child(new_bullet)
	else	:
		var new_bullet  = BULLET.instantiate()
		new_bullet.global_position = %ShootPoint.global_position
		new_bullet.global_rotation = %ShootPoint.global_rotation
		%ShootPoint.add_child(new_bullet)

func _on_timer_timeout() -> void:
	var player = get_node("/root/Game/Player")
	Shoot()
	
	if player.has_smg:
		$Timer.wait_time = 0.15
	
	elif player.has_ar:
		$Timer.wait_time = 0.35
	
	elif player.has_sniper:
		$Timer.wait_time = 1

	else:
		$Timer.wait_time = 0.6

	pass # Replace with function body.
