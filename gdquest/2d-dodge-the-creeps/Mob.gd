extends RigidBody2D

export var min_speed: float = 150.0
export var max_speed: float = 250.0

func _ready() -> void:
	$AnimatedSprite.play()
	var mob_types: Array = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	$VisibilityNotifier2D.connect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
