extends CanvasLayer
@onready var points_label: Label = %PointsLabel

# VARIABLES
var points = 0

func add_point():
	points += 1
	print(points)
	points_label.text = ": " + str(points)
	
