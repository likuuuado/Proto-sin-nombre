extends CharacterBody3D


const speed = 5.0
const jumpSpeed = 4.5
const maxJumps = 2
const rSpeed = 2.0

var saltos := 0
var coins := 0


func _physics_process(delta: float) -> void:

	# Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		saltos = 0


	# Salto / doble salto
	if Input.is_action_just_pressed("ui_accept") and saltos < maxJumps:
		velocity.y = jumpSpeed
		saltos += 1


	
	if Input.is_key_pressed(KEY_A):
		rotate_y(rSpeed * delta)

	if Input.is_key_pressed(KEY_D):
		rotate_y(-rSpeed * delta)


	
	var input_dir := Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)

	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()


	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)


	move_and_slide()


func add_coin(amount := 1) -> void:
	coins += amount
	print("Monedas: ", coins)
