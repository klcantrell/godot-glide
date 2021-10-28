extends Sprite

var speed = 400
var angular_speed = PI

func _ready() -> void:
	var timer = get_node("Timer")
	timer.connect("timeout", self, "_on_Timer_timeout")

func _process(delta) -> void:
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta


func _on_Button_pressed() -> void:
	set_process(not is_processing())

func _on_Timer_timeout() -> void:
	visible = not visible
