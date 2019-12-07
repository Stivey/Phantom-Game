extends Area2D
var allplay2 = false
func _ready():
	pass
func _on_Area2D2_body_entered(body):
		if body.is_in_group('player'):
			if allplay2 == false:
				$"../AnimationPlayer".play('press')
				allplay2 = true
				$"../Area2D".visible=true
				$"../Area2D".position.y -= 215
