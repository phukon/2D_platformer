extends CanvasLayer

var coins = 0
func _ready() -> void:
	$coins.text = String(coins)

func _physics_process(delta: float) -> void:
	if coins == 3:
		get_tree().change_scene("res://Levels/Level1.tscn")

func _on_coin_collected() -> void:
	coins += 1
	_ready()
