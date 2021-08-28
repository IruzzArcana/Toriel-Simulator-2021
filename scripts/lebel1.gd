extends Spatial


var rand_x 
var rand_z
var r = 100
func _ready():
	randomize()
	for i in range(200):
		var cubes = preload("res://scenes/objects/obj_cubes.tscn").instance();
		rand_x = rand_range(-100 , 100)
		rand_z = rand_range(-2000 , 2000)
		cubes.global_transform.origin = Vector3(rand_x, 1, rand_z)
		add_child(cubes)

func _process(delta):
	if global.loading == true:
		$Control/Loading.show()
	else: $Control/Loading.hide()


func _on_Timer_timeout():
	global.loading = false;
