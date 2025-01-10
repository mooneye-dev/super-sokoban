extends Object

class_name GameGrid

var grid : Dictionary = {}

func _init():	
	pass
	
func put(x : int, y : int, piece : GamePiece):
	grid[coord_key(x, y)] = piece
	piece.grid = self
	piece.x = x
	piece.y = y
	pass

func empty(x : int, y : int) -> bool:
	return !grid.has(coord_key(x, y))
	
func at(x : int, y : int) -> GamePiece:
	if !empty(x, y):
		return grid.get(coord_key(x, y))
	return null
	
func remove(x : int, y : int):
	grid.erase(coord_key(x, y))
	
func coord_key(x : int, y : int) -> String:
	return "%d,%d" % [x, y]

func print():
	for key in grid.keys():
		print_debug("G(%s): %s" % [key, grid[key].name])
