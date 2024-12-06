extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		if (y_delta > 30):
			print("eliminated enemy")
			queue_free()
			body.bounce()
		else:
			print("Decrease palyer health")
			body.queue_free()
