extends KinematicBody2D

const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1


func _physics_process(delta):
	velocity.x = SPEED * direction
	velocity = move_and_slide(velocity, FLOOR)

	if is_on_wall():
		direction *= -1
