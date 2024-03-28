extends CharacterBody2D

@export var speed: float = 300
@export var accel: float =  100

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D as AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if Input.is_action_pressed("move_down"):
		anim_sprite.play("move_down")
	elif Input.is_action_pressed("move_left"):
		anim_sprite.play("move_left")
	elif Input.is_action_pressed("move_right"):
		anim_sprite.play("move_right")
	elif Input.is_action_pressed("move_up"):
		anim_sprite.play("move_up")
		
	if Input.is_action_just_released("move_down"):
		anim_sprite.play("idle_down")
	elif Input.is_action_just_released("move_left"):
		anim_sprite.play("idle_left")
	elif Input.is_action_just_released("move_right") || Input.is_action_just_released("interact"):
		anim_sprite.play("idle_right")
	elif Input.is_action_just_released("move_up"):
		anim_sprite.play("idle_up")	
	
	if Input.is_action_pressed("interact"):
		anim_sprite.play("interact_right")
		
	velocity.x = move_toward(velocity.x, speed * direction.x, accel)
	velocity.y = move_toward(velocity.y, speed * direction.y, accel)
	move_and_slide()

