extends Spatial

func _ready():
	$Control/mus_dogsong.play()

func _on_SButton_pressed():
	global.loading = true;
	get_tree().change_scene("res://scenes/lebel1.tscn");


func _on_QButton_pressed():
	get_tree().quit();
