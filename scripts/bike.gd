extends RigidBody2D

var speed = 0.0
var angle = 0.0
var max_speed = 100.0
var acceleration = 45.0
var turning_power = 35.0

@onready var sprite = $Character
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		angle += delta * turning_power
		sprite.rotate(deg_to_rad((delta * turning_power)))
	if Input.is_action_pressed("ui_left"):
		angle -= delta * turning_power
		sprite.rotate(deg_to_rad((-delta * turning_power)))
	if Input.is_action_pressed("ui_up"):
		speed += delta * acceleration
		if (speed > max_speed):
			speed = max_speed
	if Input.is_action_pressed("ui_down"):
		speed -= delta * acceleration
		if (speed < -max_speed/2):
			speed = -max_speed/2
		
	position += Vector2(-speed * delta, 0).rotated(deg_to_rad(angle))

func _on_area_2d_body_entered(body):
	max_speed *= 3
	acceleration *= 3
	turning_power *= 2

func _on_area_2d_body_exited(body):
	max_speed /= 3
	acceleration /= 3
	turning_power /= 2
