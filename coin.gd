extends Area2D





func _on_coin_body_entered(body: Node) -> void:
	$AnimationPlayer.play("bounce_animation")
	body.add_coin() #will not work if one of the coin objects have entered or
# overlapped one of the platforms(or other static objects).

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	queue_free()
