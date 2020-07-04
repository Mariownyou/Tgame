extends KinematicBody2D

onready var ray = $RayCast2D
var grid_size = 16
var inputs = {
	'ui_up' : Vector2.UP,
	'ui_down' : Vector2.DOWN,
	'ui_left' : Vector2.LEFT,
	'ui_right' : Vector2.RIGHT
}

var is_dead = false

func _unhandled_input(event):
	
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()	


func move(dir):
	if is_dead == false:
		var game = get_parent()
		var vector_pos = inputs[dir] * grid_size
		ray.cast_to = vector_pos
		ray.force_raycast_update()
		if !ray.is_colliding():
			position += vector_pos
		else:
			var collider = ray.get_collider()
			if collider.is_in_group('enemy'):
				dead()
				print('dead')


func dead():
	is_dead = true
	get_tree().reload_current_scene()
	


