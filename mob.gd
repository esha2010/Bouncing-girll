extends Area2D

@export var range_x = 120.0   
@export var speed = 60.0     
@export var bob = 0.0         

var start = Vector2.ZERO     
var direction = 1.0          
var time = 0.0


func _ready():
	start = position
	time = randf() * 6.0
	body_entered.connect(_on_body_entered)


func _process(delta):
	time = time + delta

	
	position.x = position.x + direction * speed * delta
	if position.x > start.x + range_x:
		direction = -1.0
	if position.x < start.x - range_x:
		direction = 1.0

	
	if bob > 0.0:
		position.y = start.y + sin(time * 3.0) * bob

	$Sprite.flip_h = direction > 0.0


func _on_body_entered(body):
	if body.is_in_group("player"):
		body.die()
