extends Area2D





func _on_coin_body_entered(body: Node) -> void:
	$AnimationPlayer.play("bounce_animation")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	queue_free()
