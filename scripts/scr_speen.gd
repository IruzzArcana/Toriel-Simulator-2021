extends AnimationPlayer

func _ready():
	var anim = get_animation("spin")
	anim.set_loop(true)
	play("spin")

