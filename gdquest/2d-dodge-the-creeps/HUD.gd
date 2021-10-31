extends CanvasLayer

signal start_game

func update_score(score: int) -> void:
	$ScoreLabel.text = str(score)

func show_message(text: String) -> void:
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over() -> void:
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Dodge the creeps"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), "timeout")
	$Button.show()

func _ready() -> void:
	$Button.connect("pressed", self, "_on_Button_pressed")
	$MessageTimer.connect("timeout", self, "_on_MessageTimer_timeout")

func _on_Button_pressed() -> void:
	$Button.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout() -> void:
	$MessageLabel.hide()
