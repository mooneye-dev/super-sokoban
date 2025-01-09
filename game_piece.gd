extends Node3D

class_name GamePiece

var grid : GameGrid
var x : int
var y : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func reposition():
	position.x = x
	position.z = -y
	
func move(dx : int, dy : int):
	grid.remove(self.x, self.y)
	grid.put(self.x + dx, self.y + dy, self)
	reposition()
	
func move_left():
	move(-1, 0)
	
func move_right():
	move(1, 0)
	
func move_up():
	move(0, 1)
	
func move_down():
	move(0, -1)
	
	
