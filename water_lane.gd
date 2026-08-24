extends Node2D

## 0 <- -> 1
@export var lane_direction: bool = 0
@export var object_speed: float
## Setting to false makes the lane spawn logs.
@export var turtle_lane: bool = 0
@export var scene: PackedScene

const LEFTBOUND = false
const RIGHTBOUND = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var object = scene.instantiate()
	object.position = Vector2(512 + 24, 16)
	object.direction = RIGHTBOUND if lane_direction else LEFTBOUND
	object.speed = object_speed
	add_child(object)
