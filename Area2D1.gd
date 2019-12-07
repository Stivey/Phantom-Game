extends Area2D
var allplay1 = false
func _ready():
	pass
func _on_Area2D1_body_entered(body):
	if body.is_in_group('player'):
		if allplay1 == false:
			$"../AnimationPlayer".play('press')
			allplay1 = true
			$"../../TileMap".set_cell(36,12,-1)
			$"../../TileMap".set_cell(36,13,-1)
	pass