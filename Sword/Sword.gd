extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func set_direction(direction):
	if(direction):
		position.x *= -1
	
func finish():
	
	queue_free()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Sword_body_entered( body ):
	if(body.get_name() == "MobPatroll"):
		body.damage(50)
