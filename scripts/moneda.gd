extends Area2D

@onready var game_manager: Node = %GameManager
@onready var ui: CanvasLayer = %UI

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		queue_free()
		ui.add_point()
