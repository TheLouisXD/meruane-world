extends Node

func _on_nivel_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level3.tscn")


func _on_nivel_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level2.tscn")
