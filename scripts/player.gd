extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite = $AnimatedSprite2D



func _physics_process(delta):

	var direction = Input.get_axis("left","right")
	var upDownDirection = Input.get_axis("up", "down")
	
	## Handle animation
	#if direction != 0:
	

	if direction:
		velocity.x = direction * SPEED
		animated_sprite.play("run")
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
	elif upDownDirection:
		velocity.y = upDownDirection * SPEED
		if upDownDirection < 0:
			animated_sprite.play("up")
		elif upDownDirection > 0:
			animated_sprite.play("down")
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.x,0, SPEED)

	move_and_slide()
