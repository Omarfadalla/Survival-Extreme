extends CharacterBody2D

signal Health_depleted
var health = 100.0
var bullet_damage = 1
var move_speed = 200
var bullet_speed_modifier = 0
var bullet_pierce_count = 0


var has_pistol = true
var has_smg = false
var smg_count = 0
var has_ar = false
var ar_count = 0
var has_shotgun = false
var shotgun_count = 0
var has_sniper = false
var sniper_count = 0
var triple_weapons_active = false

func _ready() -> void:
	$AnimatedSprite2D.play("Completed")
	pass

func _physics_process(delta: float) -> void:

	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * move_speed 

	if velocity.length() > 0 :
		play_walk_animation()
	else:
		play_idle_animation()

	const DAMAGE_RATE = 5
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() >0 :
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0 :
			Health_depleted.emit()
			$AnimatedSprite2D.play("Dead")

	move_and_slide()

	pass

func play_idle_animation():
	$AnimatedSprite2D.play("Idle")
	pass

func play_walk_animation():
	$AnimatedSprite2D.play("Run")
	pass
	

	
	
