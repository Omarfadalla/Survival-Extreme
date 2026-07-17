extends CharacterBody2D



func _physics_process(_delta: float) -> void:
	
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 300 
	
	if velocity.length() > 0 :
		play_walk_animation()
	else:
		play_idle_animation()




	move_and_slide() 
	pass

func play_idle_animation():
	$AnimatedSprite2D.play("idle")
	pass

func play_walk_animation():
	$AnimatedSprite2D.play("walk")
	pass
	
