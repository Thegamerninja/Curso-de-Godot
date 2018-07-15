extends KinematicBody2D

var velocity = Vector2(1, 0)
var gravity = 400
var speed = 150
var hp = 100

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	
		
		
	
	velocity.y += gravity * delta
	
	if(is_on_floor()):
		velocity.y = 0
		
	
	if(!test_move(Transform2D(0, Vector2(position.x + 64 * velocity.x, position.y)), Vector2(0, 1))):
		velocity.x *= -1
		$MobAreaVisible.position *= -1
		
		
	
	move_and_slide(Vector2(velocity.x * speed, velocity.y), Vector2(0, -1))
	if(get_slide_count() > 0):
		var mobCollision = get_slide_collision(get_slide_count() - 1)
		if(mobCollision != null):
			if(mobCollision.collider.get_name() == "Player"):
				mobCollision.collider.damage(100)


func damage(damage):
	hp -= damage
	checkLife()

func checkLife():
	if(hp <= 0):
		queue_free()


func _on_MobAreaVisible_body_entered( body ):
	if(body.get_name() == "Player"):
		speed = 300
		
		




func _on_MobAreaVisible_body_exited( body ):
	if(body.get_name() == "Player"):
		speed = 150
