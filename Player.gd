extends KinematicBody2D
var mpx
var mpy
var col
const GRAVITY = 600.0 # pixels/second/second
const FLOOR_ANGLE_TOLERANCE = 40
const WALK_FORCE = 600
const WALK_MIN_SPEED = 10
const WALK_MAX_SPEED = 250
const STOP_FORCE = 1000
const JUMP_SPEED = 500
const JUMP_MAX_AIRBORNE_TIME = 0.2
const SLIDE_STOP_VELOCITY = 1.0 # one pixel/second
const SLIDE_STOP_MIN_TRAVEL = 1.0 # one pixel
var velocity = Vector2()
var on_air_time = 100
var jumping = false
var prev_jump_pressed = false
func _physics_process(delta):
	var force = Vector2(0, GRAVITY)
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Esc.tscn")
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		$AnimationPlayer.play('an')
	if Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		$AnimationPlayer.play('an')
	var walk_left = Input.is_action_pressed("ui_left")
	var walk_right = Input.is_action_pressed("ui_right")
	var jump = Input.is_action_pressed("ui_up")
	var stop = true
	if walk_left:
		if velocity.x <= WALK_MIN_SPEED and velocity.x > -WALK_MAX_SPEED:
			force.x -= WALK_FORCE
			stop = false
	elif walk_right:
		if velocity.x >= -WALK_MIN_SPEED and velocity.x < WALK_MAX_SPEED:
			force.x += WALK_FORCE
			stop = false
	if stop:
		var vsign = sign(velocity.x)
		var vlen = abs(velocity.x)
		vlen -= STOP_FORCE * delta
		if vlen < 0:
			vlen = 0
		velocity.x = vlen * vsign
	velocity += force * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if is_on_floor():
		on_air_time = 0
	if jumping and velocity.y > 0:
		jumping = false
	if on_air_time < JUMP_MAX_AIRBORNE_TIME and jump and not prev_jump_pressed and not jumping:
		velocity.y = -JUMP_SPEED
		jumping = true
	on_air_time += delta
	prev_jump_pressed = jump
func raycast(from,to):
	var space_state=get_world_2d().direct_space_state
	return space_state.intersect_ray(from,to,[self])
func mouse_action():
	if Input.is_action_pressed("m_left"):
		var mpos = get_global_mouse_position()
		var col = raycast(self.position,mpos)
		print(col)
func _ready():
	add_to_group('player')