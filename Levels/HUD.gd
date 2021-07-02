extends CanvasLayer

var coins = 0
func _ready() -> void:
	$coins.text = String(coins)


func _on_coin_collected() -> void:
	coins += 1
	_ready()
	if coins == 3:
		get_tree().change_scene("res://Levels/GameWinScreen.tscn")
