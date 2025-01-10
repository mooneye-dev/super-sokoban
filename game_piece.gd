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
	
func valid_move(dx : int, dy : int) -> bool:
	return grid.empty(self.x + dx, self.y + dy)
	
func reposition():
	position.x = x
	position.z = -y
	
func move(dx : int, dy : int):
	grid.remove(self.x, self.y)
	grid.put(self.x + dx, self.y + dy, self)
	reposition()
	
	
