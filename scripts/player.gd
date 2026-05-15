extends CharacterBody3D


var direction: float
var speed := 4
signal shoot_laser(pos:Vector3)


func _physics_process(_delta: float) -> void:
	direction = Input.get_axis('left','right')
	velocity.x = direction * speed
	$craft_speederD.rotation.z = move_toward($craft_speederD.rotation.z, -direction / 2.0, _delta)
	velocity.y = sin(Time.get_ticks_msec() / 500.0) / 4.0
	 
	if Input.is_action_just_pressed("shoot"):
		shoot_laser.emit(global_position)
		
	move_and_slide()
