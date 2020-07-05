extends Area2D

var health = 1


func _on_Food_body_entered(body):
	random_pos()
	if health != 3:
		health += 1
	print(position, health)
	
func random_pos():
	var x = randi()% 10 * 16
	var y = randi()% 10 * 16
	position.x = x
	position.y = y
	
 
