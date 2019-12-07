extends Button
func _ready():
	pass
func _on_start_pressed():
	$"../AnimationPlayer".play('pereh')
		
	pass
func _on_AnimationPlayer_animation_finished(anim_name):
	print(123)
	get_tree().change_scene("res://Level1.tscn")
	pass