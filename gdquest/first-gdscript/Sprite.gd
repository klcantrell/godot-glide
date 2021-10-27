extends Sprite

const angular_speed: float = PI
const speed: float = 400.0

func _process(delta: float) -> void:
	var direction: int = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
	
	rotation += angular_speed * direction * delta
	var velocity: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed

	position += velocity * delta
