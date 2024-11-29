extends Node

@onready var mundo = $TileMapLayer
@onready var camera = $CharacterBody2D/Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#set_camera_limits()
	pass
	
func set_camera_limits():
	var map_size = mundo.get_used_rect()
	var map_cellsize = mundo.cell_size
	camera.limit_left = map_cellsize.x
	camera.limit_right = map_cellsize.x
	camera.limit_top = map_cellsize.y
	camera.limit_bottom = map_cellsize.y
