extends CharacterBody2D

@export var speed: float = 300
@export var accel: float =  100
var last_direction = [0, 1]

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D as AnimatedSprite2D
@onready var inventory_ui = $InventoryUI


func _ready():
	Global.set_player_reference(self)

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction.x + direction.y != 0:
		last_direction = [direction.x, direction.y]
	
	if Global.grab_controls == true:
		# костыль
		if Global.animated_scene:
			return
		var anim_direction = anim_sprite.get_animation().get_slice('_', 1)
		anim_sprite.play("idle_" + anim_direction)
		return
		
	if !Input.is_anything_pressed():
		match last_direction:
			[0.0, 1.0]:
				anim_sprite.play("idle_down")
			[1.0, 0.0]:
				anim_sprite.play("idle_right")
			[0.0, -1.0]:
				anim_sprite.play("idle_up")
			[-1.0, 0.0]:
				anim_sprite.play("idle_left")
				
	if Input.is_action_pressed("move_down"):
		anim_sprite.play("move_down")
	elif Input.is_action_pressed("move_left"):
		anim_sprite.play("move_left")
	elif Input.is_action_pressed("move_right"):
		anim_sprite.play("move_right")
	elif Input.is_action_pressed("move_up"):
		anim_sprite.play("move_up")
		
	if Input.is_action_pressed("interact"):
		match last_direction:
			[0.0, 1.0]:
				anim_sprite.play("interact_down")
			[1.0, 0.0]:
				anim_sprite.play("interact_right")
			[0.0, -1.0]:
				anim_sprite.play("interact_up")
			[-1.0, 0.0]:
				anim_sprite.play("interact_left")
				
				
	velocity.x = move_toward(velocity.x, speed * direction.x, accel)
	velocity.y = move_toward(velocity.y, speed * direction.y, accel)
	move_and_slide()

func _input(event):
	if event.is_action_pressed('inventory') and !Global.grab_controls:
		inventory_ui.visible = !inventory_ui.visible
		get_tree().paused = !get_tree().paused
