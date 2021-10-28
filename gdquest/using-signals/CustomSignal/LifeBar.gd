extends TextureProgress

func _ready() -> void:
	var player = get_node("../Player")
	player.connect("health_changed", self, "_on_Player_health_changed")

func _on_Player_health_changed(new_health: int) -> void:
	value = new_health
