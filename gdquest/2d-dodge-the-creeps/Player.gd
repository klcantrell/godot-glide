extends Area2D

signal hit

export var speed: float = 400.0
var screen_size: Vector2 = Vector2.ZERO

func _ready() -> void:
	$".".connect("body_entered", self, "_on_Player_body_entered")
	hide()

func _process(delta: float) -> void:
	screen_size = get_viewport_rect().size

	var direction: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1

	if direction.length() > 0:
		direction = direction.normalized()
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += direction * speed * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

	if direction.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = direction.x < 0
	elif direction.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = direction.y > 0

func start(new_position: Vector2) -> void:
	position = new_position
	show()
	$CollisionShape2D.disabled = false

func _on_Player_body_entered(_body: Node) -> void:
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	emit_signal("hit")
