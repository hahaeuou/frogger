extends CharacterBody2D

var is_on_log = false
var log_scene: Area2D
const GRID_SIZE = 32

func _ready():
	@warning_ignore("integer_division")
	# Center bottom of the screen.
	position = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width") / 2,
		ProjectSettings.get_setting("display/window/size/viewport_height") - GRID_SIZE / 2)


func _physics_process(delta: float) -> void:
	check_collisions()
	#print(is_on_log)
	if Input.is_action_just_pressed("w"):
		position.y -= GRID_SIZE
		#check_collisions()
	if Input.is_action_just_pressed("s"):
		position.y += GRID_SIZE
		#check_collisions()
	if Input.is_action_just_pressed("a"):
		position.x -= GRID_SIZE
		#check_collisions()
	if Input.is_action_just_pressed("d"):
		position.x += GRID_SIZE
		#check_collisions()
	if is_on_log:
		position.x -= log_scene.speed * delta * (-1)**int(log_scene.direction)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("logs"):
		is_on_log = true
		log_scene = area
		#assert(log_scene.monitorable)
	call_deferred("check_death_in_water", area)

#This function is not working with the turtles
#is_on_log is still true after turtle "dives into water"
func _on_area_2d_area_exited(area: Area2D) -> void:
	print("area exited")
	if area.is_in_group("logs"):
		is_on_log = false


func check_death_in_water(area):
	if area.is_in_group("water") and not is_on_log:
		pass
		#queue_free()


func check_collisions():
	for area in $Area2D.get_overlapping_areas():
		_on_area_2d_area_entered(area)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
