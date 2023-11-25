extends Camera2D

@export var movement_speed: float

func _process(delta):
	var direction: Vector2 = Input.get_vector("Left", "Right", "Up", "Down")
	var velocity: Vector2 = Vector2.ZERO
	velocity = direction.normalized() * movement_speed * delta
	position += velocity
