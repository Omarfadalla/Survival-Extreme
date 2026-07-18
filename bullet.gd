extends Area2D

var travel_distance = 0

func _physics_process(delta: float) -> void:
	const Speed = 300
	const RANGE = 1200
	
	var direction  = Vector2.RIGHT.rotated(rotation)
	position += direction * Speed * delta
	
	travel_distance += Speed * delta
	if travel_distance > RANGE:
		queue_free()
	 
	pass


func _on_body_entered(body) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
	pass # Replace with function body.
