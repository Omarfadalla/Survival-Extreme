extends CharacterBody2D

var player 

func _ready() -> void:
	player = get_node("/root/Game/Player")
	pass
func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 20
	move_and_slide() 
	pass

func Play_walk():
	$CharacterBody2D/AnimatedSprite2D.play("walk")
	
	
func Play_hurt():
	$CharacterBody2D/AnimatedSprite2D.play("hurt")
	$CharacterBody2D/AnimatedSprite2D.queue("walk")
