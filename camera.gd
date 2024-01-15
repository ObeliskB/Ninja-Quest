extends Camera2D

@onready var player = $"../Player"

func _process(_delta):
	call_deferred("update_camera")
	
func  update_camera():
	position.x = player.position.x - 576

