extends Area2D

var travel_distance = 0
var times_peirced = 0

func _physics_process(delta: float) -> void:
	var player = get_node("/root/Game/Player")
	
	var current_speed = 300 + player.bullet_speed_modifier
	const RANGE = 1200
	
	var direction  = Vector2.RIGHT.rotated(rotation)
	position += direction * current_speed * delta
	travel_distance += current_speed * delta

	if travel_distance > RANGE:
		queue_free()

	pass

func _on_body_entered(body) -> void:
	var player = get_node("/root/Game/Player")

	if body.has_method("take_damage"):
		var final_damage = player.bullet_damage

		if player.has_sniper:
			final_damage *=2.5
			body.take_damage(final_damage)
		
		elif player.has_pistol:
			final_damage = 1
			body.take_damage(final_damage)
		
		if times_peirced < player.bullet_pierce_count:
			times_peirced +=1
		
	else:
		queue_free()

	pass # Replace with function body.
