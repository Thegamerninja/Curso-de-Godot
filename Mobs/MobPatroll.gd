extends KinematicBody2D

var velocity = Vector2(1, 0)
var gravity = 400
var speed = 200
var follow = false

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	
	if(follow):
		speed = 400
		
	else:
		speed = 200
	
	velocity.y += gravity * delta
	
	if(is_on_floor()):
		velocity.y = 0
		
	
	if(!test_move(Transform2D(0, Vector2(position.x + 64 * velocity.x, position.y)), Vector2(0, 1))):
		velocity.x *= -1
		$MobAreaVisible.position *= -1
		
		
	
	move_and_slide(Vector2(velocity.x * speed, velocity.y), Vector2(0, -1))

func _on_MobAreaVisible_body_entered( body ):
	if(body.get_name() == "Player"):
		follow = true
		
		




func _on_MobAreaVisible_body_exited( body ):
	if(body.get_name() == "Player"):
		follow = false
