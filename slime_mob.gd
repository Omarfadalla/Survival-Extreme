extends CharacterBody2D

var health = 4

var player 
func Play_walk():
	$AnimatedSprite2D.play("walk")
	
func Play_hurt():
	$AnimatedSprite2D.play("hurt")
	$AnimatedSprite2D.queue("walk")

func _ready() -> void:
	player = get_node("/root/Game/Player")
	Play_walk()
	pass

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 20
	move_and_slide() 
	pass

func take_damage():

	health -=1
	$AnimatedSprite2D.play("hurt")

	

	if health == 0:
		queue_free()
		const Explosion = preload("res://Explosions/explosion.tscn")
		var Smoke = Explosion.instantiate()
		get_parent().add_child(Smoke)
		Smoke.global_position = global_position
		queue_free()
