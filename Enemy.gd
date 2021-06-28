extends KinematicBody2D

var velocity = Vector2()
export var direction =  -1


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.y += 20
	
	move_and_slide(velocity)
