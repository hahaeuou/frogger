extends Area2D

var direction: bool
var speed = 128
var player: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(0 - 24, 16) if direction else Vector2(512 + 24, 16)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if direction:
		position.x += speed * delta
	else:
		position.x -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
