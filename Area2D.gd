extends Area2D
var allplay = false
func _ready():
	pass
func _on_Area2D_body_entered(body):
	if body.is_in_group('player'):
		if allplay == false:
			$"../AnimationPlayer".play('press')
			allplay = true
			$"../../TileMap".set_cell(10,9,0)
			$"../../TileMap".set_cell(11,9,0)
			$"../../TileMap".set_cell(12,9,0)
			$"../../TileMap".set_cell(13,9,0)
			$"../../TileMap".set_cell(14,9,0)
			$"../../TileMap".set_cell(15,9,0)
			$"../../TileMap".set_cell(16,9,0)
			$"../../TileMap".set_cell(17,9,0)
	pass