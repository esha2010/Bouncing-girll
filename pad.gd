extends Area2D
# BOUNCE PAD: launches the player high into the air.

@export var force = -1050.0   # negative = up. Make it bigger for a higher launch!


func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if body.is_in_group("player") and body.velocity.y > 0.0:
			body.velocity.y = force
			$Sound.play()
