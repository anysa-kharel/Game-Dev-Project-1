extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -450.0
const GRAVITY = 1000.0
const SWIM_SPEED = 140.0
const FLOAT_SPEED = 50.0
const CLIMB_SPEED = 200.0

var is_swimming = false
var is_on_ladder = false
var is_climbing = false


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if is_on_ladder and Input.is_action_pressed("up"):
		is_climbing = true
	
	if is_climbing:
		climb_movement()
	elif is_swimming:
		swim_movement()
	else:
		land_movement(delta)

	move_and_slide()
	play_animation()

func land_movement(delta: float) -> void:
	var direction := Input.get_axis("left", "right")

	if not is_on_floor():
		velocity.y += GRAVITY * delta

	velocity.x = direction * SPEED

	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func swim_movement() -> void:
	var horizontal := Input.get_axis("left", "right")
	var vertical := Input.get_axis("up", "down")

	velocity.x = horizontal * SWIM_SPEED

	if vertical != 0:
		velocity.y = vertical * SWIM_SPEED
		animated_sprite_2d.play("swim")

	else:		
		velocity.y = -FLOAT_SPEED

func play_animation() -> void:
	var direction := Input.get_axis("left", "right")
	
	if is_swimming:
		animated_sprite_2d.play("swim")
		
		if not is_on_floor():
			animated_sprite_2d.play("swim")

		var horizontal := Input.get_axis("left", "right")

		if horizontal != 0:
			animated_sprite_2d.flip_h = horizontal < 0
			animated_sprite_2d.play("swim")

		return
		
	elif is_climbing:
		animated_sprite_2d.play("climb")
		return

	else:
		if direction != 0:
			animated_sprite_2d.flip_h = direction < 0

		if Input.is_action_just_pressed("up") and is_on_floor():
			animated_sprite_2d.play("jump")

		elif direction != 0 and is_on_floor():
			animated_sprite_2d.play("run")
			
		elif is_on_floor():
			animated_sprite_2d.play("idle")

		else:
			pass

func enter_water() -> void:
	is_swimming = true
	velocity.y = 0

func exit_water() -> void:
	is_swimming = false

func enter_ladder() -> void:
	is_on_ladder = true

func exit_ladder() -> void:
	is_on_ladder = false
	is_climbing = false
	
func climb_movement() -> void:
	var vertical := Input.get_axis("up", "down")
	var horizontal:=Input.get_axis("left","right")
	velocity.x = horizontal * SPEED
	velocity.y = vertical * CLIMB_SPEED
