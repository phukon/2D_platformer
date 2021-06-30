extends KinematicBody2D


var velocity = Vector2(0, 0)
const SPEED = 350
const GRAVITY = 35
const JUMPFORCE = -1000


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")

	if not is_on_floor():
		$Sprite.play("air")
	velocity.y += GRAVITY

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.2)




func _on_fall_zone_body_entered(body: Node) -> void:
	get_tree().change_scene("res://Levels/Level1.tscn")


func bounce():
	velocity.y = JUMPFORCE*0.57
