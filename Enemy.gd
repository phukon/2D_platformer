extends KinematicBody2D

var speed = 50
var velocity = Vector2()
export var direction =  -1
export var detects_cliffs = true

func _ready() -> void:
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs

func _physics_process(delta: float) -> void:
	
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP) #or else the gravity will keep adding


func _on_top_checker_body_entered(body: Node) -> void:
	$AnimatedSprite.play("squashed")
	speed = 0
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0, false)
	$top_checker.set_collision_layer_bit(4, false) #cuz top_checker has got it's on collision layer and masks
	$top_checker.set_collision_mask_bit(0, false)
	$side_checker.set_collision_layer_bit(4, false)
	$side_checker.set_collision_mask_bit(0, false)#or else the player will hit the side checker after the top checker is removed from the mask and layers
	$Timer.start()

func _on_side_checker_body_entered(body: Node) -> void:
	get_tree().change_scene("res://Levels/Level1.tscn")

func _on_Timer_timeout() -> void:
	queue_free()
