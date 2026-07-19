extends CharacterBody2D

var health = 1
var slime_number = 1
var player 
const Explosion = preload("res://Explosions/explosion.tscn") 



func Play_walk():
	if slime_number ==1:	
		$AnimatedSprite2D.play("walk_1")
	elif slime_number ==2:
		$AnimatedSprite2D.play("walk_2")
	elif slime_number ==3:
		$AnimatedSprite2D.play("walk_3")
	
func Play_hurt():
	if slime_number ==1:
		$AnimatedSprite2D.play("hurt_1")
		$AnimatedSprite2D.queue("walk_1")
	elif slime_number ==2:
		$AnimatedSprite2D.play("hurt_2")
		$AnimatedSprite2D.queue("walk_2")
	if slime_number ==3:
		$AnimatedSprite2D.play("hurt_3")
		$AnimatedSprite2D.queue("walk_3")

func _ready() -> void:
	player = get_node("/root/Game/Player")
	
	if Global.current_round ==1:
		
		slime_number =1 
		health = 1

	elif Global.current_round ==2:

		if randf() < 0.5:
			
			slime_number =1 
			health = 1
		else:

			slime_number =2 
			health = 2
	elif Global.current_round ==3:

		slime_number =2 
		health = 2
	elif Global.current_round == 4:

		if randf() < 0.5:
			slime_number =2
			health = 2
		else:
			slime_number =3 
			health = 3
	else:
		slime_number = 3
		health += 4 + (Global.current_round *2)

	Play_walk()
	pass

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 70
	move_and_slide() 
	pass



func take_damage():
	health -=1

	var current_animation = $AnimatedSprite2D.animation

	if "1" in current_animation:
		$AnimatedSprite2D.play("hurt_1")
	elif "2" in current_animation:
		$AnimatedSprite2D.play("hurt_2")
	else:
		$AnimatedSprite2D.play("hurt_3")
		
	if health == 0:	

		var Smoke = Explosion.instantiate()
		get_parent().add_child(Smoke)
		Smoke.global_position = global_position
		
		if "1" in current_animation:
			Smoke.get_node("AnimatedSprite2D").play("explosion_1")
		elif "2" in current_animation:
			Smoke.get_node("AnimatedSprite2D").play("explosion_2")
		elif "3" in current_animation:
			Smoke.get_node("AnimatedSprite2D").play("explosion_3")

		queue_free()
