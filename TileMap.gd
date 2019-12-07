extends TileMap
var mpx
var mpy
func _process(delta):
	mpx=get_global_mouse_position().x
	mpy=get_global_mouse_position().y
	mpx=mpx/64
	mpy=mpy/64
	if Input.is_action_pressed("rr"):
		if Input.is_action_pressed("m_left"):
			self.set_cell(mpx,mpy,0)
		if Input.is_action_pressed("m_right"):
			self.set_cell(mpx,mpy,-1)
func _ready():
	print(88)
	var res = load_data()
	if res:
		$"../TileMap".clear()
		for coord in res:
		#	$"../TileMap".set_cellv(coord,0)\
			$"../TileMap".set_cellv(Vector2(coord.x,coord.y),coord.z)
	
func load_data():
	var content = null
	var filename = "res://save_game.dat"
	var file = File.new()
	if file.file_exists(filename):
		file.open(filename, File.READ)
		content = file.get_var()
		file.close()
	return content