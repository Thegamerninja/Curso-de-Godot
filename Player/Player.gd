extends KinematicBody2D

var velocity = Vector2(0, 0)
var gravity = 400
var speed = 200
var swordLoad = load("res://Sword/Sword.tscn")
var swordInstance
var is_atack = false

func _ready():
	set_physics_process(true)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	
	move(delta)
	animation()
	

func move(delta):
	
	velocity.y += gravity * delta
	
	if(Input.is_action_pressed("ui_right") && !is_atack):
		velocity.x = speed
		
	elif(Input.is_action_pressed("ui_left") && !is_atack):
		velocity.x = -speed

		
	else:
		
		velocity.x = 0
		
	if(Input.is_action_pressed("Atack") && !is_atack):
		swordInstance = swordLoad.instance()
		swordInstance.set_direction($AnimatedSprite.flip_h)
		add_child(swordInstance)
		is_atack = true
		$AnimatedSprite.animation = "Atack"
		$AnimatedSprite.frame = 0
		
	
	if(is_on_floor()):
		velocity.y = 0
		
		if(Input.is_action_pressed("ui_up") && !is_atack):
			velocity.y = -125
	
	move_and_slide(velocity, Vector2(0, -1))
	

func animation():
	
	if(velocity.x > 0 && !is_atack):
		$AnimatedSprite.flip_h = false
		if(is_on_floor()):
			$AnimatedSprite.animation = "Run"
			
	if(velocity.x < 0 && !is_atack):
		$AnimatedSprite.flip_h = true
		if(is_on_floor()):
			$AnimatedSprite.animation = "Run"
			
	if(velocity.x == 0 && is_on_floor() && !is_atack):
		$AnimatedSprite.animation = "Idle"
		
	if(velocity.y < 0 && !is_on_floor() && !is_atack):
		$AnimatedSprite.animation = "Jump"
		
	if(velocity.y > 0 && !is_on_floor() && !is_atack):
		$AnimatedSprite.animation = "Fall"



func _on_AnimatedSprite_animation_finished():
	if(is_atack):
		swordInstance.finish()
		is_atack = false
		
