extends Node

@onready var pause_menu: Panel = %PauseMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("pause")
	if (esc_pressed == true):
		get_tree().paused = true
		pause_menu.show()
	


func _on_resume_pressed() -> void:
	get_tree().paused = false
	pause_menu.hide()

func _on_quit_pressed() -> void:
	get_tree().paused = false
	Transition.change_scene_to_file("res://scenes/main_menu.tscn")
