tool
extends Area2D
class_name RegularPolygon, "res://Ui/polygon_icon.png"


export(int, 2, 1000) var points_count = 4 setget set_points_count
export(float) var radius = 50.0 setget set_radius
export(float) var line_width = 8 setget set_line_width
export(Color) var line_color = Color.whitesmoke setget set_line_color
export(Color) var fill_color = Color.azure setget set_fill_color

var points := []
var perimeter : Line2D
var frozen := true


func set_points_count(pcount):
	points_count = pcount
	recalc_points()
	redraw_shape()

func set_radius(rad):
	radius = rad
	recalc_points()
	redraw_shape()

func set_line_width(value):
	line_width = value
	redraw_shape()

func set_line_color(col):
	line_color = col
	redraw_shape()
	
func set_fill_color(col):
	fill_color = col
	if fill_color and $FillArea:
		$FillArea.color = fill_color

func recalc_points():
	var theta = 0
	points = []
	var point : Vector2
	for n in range(points_count):
		theta  = TAU / points_count * n
		point = Vector2(sin(theta), cos(theta)) * radius
		points.append(point)

func redraw_shape():
	if !frozen:
		if perimeter:
			perimeter.free()
		perimeter = Line2D.new()
		add_child(perimeter)
		perimeter.default_color = line_color
		perimeter.width = line_width
		perimeter.set_antialiased(true)
		
		for vect in $Vectors.get_children():
			vect.free()

		for point in points:
			perimeter.add_point(point)
			var vect = RayCast2D.new()
			var line = Line2D.new()
			$Vectors.add_child(vect)
			vect.add_child(line)
			vect.collide_with_areas = true
			vect.collide_with_bodies = false
			vect.enabled = true
			vect.cast_to = point	
			line.add_point(vect.position)
			line.add_point(point)
			line.default_color = line_color
			line.width = line_width
			line.set_antialiased(true)
		perimeter.add_point(points[0])
		$FillArea.polygon = points
		$FillArea.global_position = global_position
		$Hitbox.polygon = points
		$Hitbox.global_position = global_position


func _on_btnPlus_pressed():
	self.points_count += 1

func _on_btnMinus_pressed():
	self.points_count -= 1


func _on_Button_pressed():
	visible = true
	get_parent().get_child(1).visible = true
	get_parent().get_child(2).visible = true
	get_parent().get_child(3).visible = false
	self.points_count = 3
	redraw_shape()

