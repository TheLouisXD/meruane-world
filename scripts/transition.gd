extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	color_rect.visible = false

func load_scene(target_scene: String):
	animation_player.play("fade_to_black")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(target_scene)
	animation_player.play_backwards("fade_to_black")

func reload_scene():
	animation_player.play("fade_to_black")
	await animation_player.animation_finished
	get_tree().reload_current_scene()
	animation_player.play_backwards("fade_to_black")





#signal on_transition_finished
#
#@onready var color_rect: ColorRect = $ColorRect
#@onready var animation_player: AnimationPlayer = $AnimationPlayer
#
#func _ready():
	#color_rect.visible = false
	#animation_player.animation_finished.connect(_on_animation_finished)
#
#func _on_animation_finished(anim_name: StringName) -> void:
	#if anim_name == "fade_to_black":
		#on_transition_finished.emit()
		#animation_player.play("fade_to_normal")
	#elif anim_name == "fade_to_normal":
		#color_rect.visible = false
	#
#func fade_transition():
	#color_rect.visible = true
	#animation_player.play("fade_to_black")
