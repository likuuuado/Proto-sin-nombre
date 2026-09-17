extends Node3D

@export var target: Node3D
@export var rSpeed := 2.0
@export var distance := 5.0

func _process(delta):
	if target == null:
		return

	var direction := Input.get_axis(
		"Q",
		"E"
	)

	rotate_y(direction * rSpeed * delta)

	global_position = target.global_position

	$Camera3D.position = Vector3(0, 0, distance)
