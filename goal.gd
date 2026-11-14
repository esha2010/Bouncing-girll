extends Area2D



func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	if body.is_in_group("player"):
		body.set_physics_process(false)     
		$Sound.play()
		await get_tree().create_timer(2.0).timeout   
		get_tree().reload_current_scene()
