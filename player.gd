extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


var gravity = 1240
var is_jumping = false 

signal morreu
signal pegouitem



func _physics_process(delta):

	if not is_on_floor():
		
		velocity.y += gravity * delta

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		
		velocity.y = JUMP_VELOCITY
		is_jumping = true
		
	elif is_on_floor():
		
		is_jumping = false

	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		
		velocity.x = direction * SPEED
		$player_sprite.scale.x = direction 
	
	else:
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	if is_on_floor():
		
		if is_jumping:
			
			print(is_jumping)
			$player_sprite.play("jump")
		
		elif direction !=0:
			
			$player_sprite.play("run")
		
		
		elif direction == 0:
			
			$player_sprite.play("idle")
		
		else:
			
			if velocity.y < 0:
				
				$player_sprite.play("jump")
			
			else:
				
				$player_sprite.play("fall")
		
	move_and_slide()
	

	
func _levouDano():
	print("Sim, levou dano")
	emit_signal("morreu")

	
