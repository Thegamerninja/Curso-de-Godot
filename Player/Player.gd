extends KinematicBody2D

var velocity = Vector2(0, 0)
var gravity = 400
var speed = 200

func _ready():
	set_physics_process(true)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	
	move(delta)
	

func move(delta):
	
	velocity.y += gravity * delta
	
	if(Input.is_action_pressed("ui_right")):
		velocity.x = speed
		if(is_on_floor()):
			$AnimatedSprite.animation = "Run"
			$AnimatedSprite.flip_h = false
		
	elif(Input.is_action_pressed("ui_left")):
		velocity.x = -speed
		if(is_on_floor()):
			$AnimatedSprite.animation = "Run"
			$AnimatedSprite.flip_h = true
		
	else:
		
		velocity.x = 0
		if(is_on_floor()):
			$AnimatedSprite.animation = "Idle"
		
	if(is_on_floor()):
		velocity.y = 0
		
		if(Input.is_action_pressed("ui_up")):
			velocity.y = -125
			$AnimatedSprite.animation = "Jump"
	
	move_and_slide(velocity, Vector2(0, -1))
	