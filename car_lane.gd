extends Node2D

var scene = preload("res://car.tscn")
## 0 <- -> 1
@export var lane_direction: bool = 0
@export var car_speed: float

const LEFTBOUND = false
const RIGHTBOUND = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var car = scene.instantiate()
	car.position = Vector2(512 + 24, 16)
	car.direction = RIGHTBOUND if lane_direction else LEFTBOUND
	car.speed = car_speed
	add_child(car)
