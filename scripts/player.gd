extends CharacterBody2D

# VARIABLES
const SPEED = 300.0
const JUMP_VELOCITY = -850.0

# ONREADY VARIABLES
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func bounce():
	velocity.y = JUMP_VELOCITY

func hurt(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = x

func _physics_process(delta: float) -> void:
	# Logica de la animacion
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "walk"
	else:
		sprite_2d.animation = "idle"
	
	var isLeft = velocity.x < 0
	var isRight = velocity.x > 0
	# Cambiamos la direccion del sprite en base a su dirección
	if (isLeft):
		sprite_2d.flip_h = true
	elif (isRight):
		sprite_2d.flip_h = false
	
	# Add the gravity. Logica del salto
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jump"
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		if Input.is_action_pressed("run"):
			velocity.x = direction * (SPEED + 200)
		else:
			velocity.x = direction * SPEED
	else:
		# este codigo baja la velocidad cuando dejamos de presionar una tecla
		velocity.x = move_toward(velocity.x, 0, 60)

	move_and_slide()
