extends Button
func _ready():
	pass
func _on_save_pressed():
	var sav = $"../../../TileMap".get_used_cells()
	save_data(sav)
	pass
func save_data(content):
	var cells_new = []
	for cell in content:
		cells_new.append(
			Vector3(cell.x,cell.y,$"../../../TileMap".get_cell(cell.x,cell.y)))
	var file = File.new()
	file.open("res://save_game.dat", File.WRITE)
	file.store_var(cells_new)
	file.close()
	print(6)

