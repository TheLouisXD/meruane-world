extends RigidBody2D

@onready var ui: CanvasLayer = %UI

var SPEED = 150

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	# Move left continuously
	linear_velocity.x = SPEED

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if (y_delta > 30):
			print("eliminated enemy")
			queue_free()
			body.bounce()
		else:
			print("Decrease palyer health")
			ui.decrease_healt()
			if (x_delta > 0):
				body.hurt(500)
			else:
				body.hurt(-500)
	elif(body.name == "terreno"):
		SPEED *= -1
