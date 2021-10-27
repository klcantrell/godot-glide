extends Sprite

const angular_speed: float = PI
const speed: float = 400.0

func _process(delta: float) -> void:
	var direction: int = \
		-1 if Input.is_action_pressed("ui_left") \
		else 1 if Input.is_action_pressed("ui_right") \
		else 0
	
	rotation += angular_speed * direction * delta
	var velocity: Vector2 = Vector2.UP.rotated(rotation) * speed \
		if Input.is_action_pressed("ui_up") \
		else Vector2.ZERO

	position += velocity * delta
