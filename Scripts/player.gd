extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -450.0
const GRAVITY = 1000.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")

	# Apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Horizontal movement
	velocity.x = direction * SPEED

	# Jump only when standing on the floor
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()

	play_animation(direction)


func play_animation(direction: float) -> void:

	# Flip character left/right
	if direction != 0:
		animated_sprite_2d.flip_h = direction < 0
		
	if Input.is_action_just_pressed("up") and not is_on_floor():
		animated_sprite_2d.play("jump")

	# Running
	elif direction != 0:
		animated_sprite_2d.play("run")
		
	elif not is_on_floor():
		animated_sprite_2d.play("swim")

	# Idle
	else:
		animated_sprite_2d.play("idle")
