extends CharacterBody2D

var player 
func Play_walk():
	$AnimatedSprite2D.play("walk")
	
func Play_hurt():
	$AnimatedSprite2D.play("hurt")
	$AnimatedSprite2D.queue("walk")

func _ready() -> void:
	player = get_node("/root/Game/Player")
	pass

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 20
	Play_walk()
	move_and_slide() 
	pass
