extends Area2D

var direction: bool
var speed = 128
var player: Node2D
var above_water = true

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


func _on_timer_timeout() -> void:
	if above_water:
		$Timer.wait_time = 3.0
		above_water = false
		set_deferred("monitorable", false)
		#assert(not monitorable)
		modulate = Color(1.0, 0.0, 0.0, 1.0)
	else:
		$Timer.wait_time = 1.0
		above_water = true
		modulate = Color(1.0, 1.0, 1.0, 1.0)
		set_deferred("monitorable", true)
