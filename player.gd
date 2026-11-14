extends CharacterBody2D


const GRAVITY = 1500.0     
const BOUNCE = -700.0       
const SPEED = 320.0         
const WALL_PUSH = 450.0     

var spawn = Vector2.ZERO    
var push = 0.0              
var duck_time = 0.0         


func _ready():
	spawn = position


func _physics_process(delta):
	var dir = 0.0
	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		dir = dir - 1.0
	if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		dir = dir + 1.0

	
	push = move_toward(push, 0.0, 1500.0 * delta)
	velocity.x = dir * SPEED + push
	velocity.y = velocity.y + GRAVITY * delta
	move_and_slide()


	if is_on_floor():
		velocity.y = BOUNCE
		duck_time = 0.15
		$BounceSound.play()


	if is_on_wall() and abs(push) < 1.0:
		push = get_wall_normal().x * WALL_PUSH
		$BounceSound.play()


	if position.y > 900:
		die()

	
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()


	if dir != 0.0:
		$Anim.flip_h = dir < 0.0   

	if duck_time > 0.0:
		duck_time = duck_time - delta
		$Anim.play("duck")
		$Anim.offset.y = 114.0      
	elif dir != 0.0:
		$Anim.play("walking")
		$Anim.offset.y = 0.0
	else:
		$Anim.play("idle")
		$Anim.offset.y = 0.0


# 
func die():
	position = spawn
	velocity = Vector2.ZERO
	push = 0.0
