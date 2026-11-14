extends Area2D

var time = 0.0


func _ready():
	body_entered.connect(_on_body_entered)


func _process(delta):
	
	time = time + delta
	$Sprite.position.y = sin(time * 3.0 + position.x * 0.01) * 5.0


func _on_body_entered(body):
	if body.is_in_group("player"):
		hide()                              
		$Sound.play()
		set_deferred("monitoring", false)   
