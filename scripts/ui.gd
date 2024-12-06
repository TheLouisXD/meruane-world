extends CanvasLayer

@onready var points_label: Label = %PointsLabel
@export var hearts : Array[Node]

# VARIABLES
var points = 0
var lives = 3

func decrease_healt():
	lives -= 1
	print(lives)
	#Verificamos cuantas vidas tiene el jugador y mostrar el numero correspondiente de corazones
	for h in 3:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
	if (lives <= 0):
		get_tree().reload_current_scene()

func add_point():
	points += 1
	print(points)
	points_label.text = ": " + str(points)
	
