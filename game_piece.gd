extends Node3D

class_name GamePiece

var grid : GameGrid
var stack : PieceStack
var x : int
var y : int
var z : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func valid_move(dx : int, dy : int) -> bool:
	return grid.is_empty(self.x + dx, self.y + dy)
	
func reposition():
	position.x = x
	position.z = -y
	position.y = z + 1.0
	
func move(dx : int, dy : int):
	stack.move(dx, dy)
	reposition()
	
	
