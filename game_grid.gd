extends Object

class_name GameGrid

var grid : Dictionary = {}

func _init():	
	pass
	
func put_piece(x : int, y : int, piece : GamePiece):	
	var piece_stack
	if is_empty(x, y):
		piece_stack = PieceStack.new(self)
		piece_stack.x = x
		piece_stack.y = y
		grid[coord_key(x, y)] = piece_stack
	else:
		piece_stack = grid[coord_key(x, y)] as PieceStack
	
	piece_stack.push(piece)
	
	piece.grid = self
	piece.stack = piece_stack
	piece.x = x
	piece.y = y
	piece.z = piece_stack.size() - 1
	pass
	
func move_stack(src_x : int, src_y : int, dst_x : int, dst_y : int):
	var stack = stack_at(src_x, src_y)
	erase(src_x, src_y)
	grid[coord_key(dst_x, dst_y)] = stack

func is_empty(x : int, y : int) -> bool:
	return !grid.has(coord_key(x, y))
	
func stack_at(x : int, y : int) -> PieceStack:
	if !is_empty(x, y):
		return grid.get(coord_key(x, y))
	return null
	
func erase(x : int, y : int):
	grid.erase(coord_key(x, y))
	
func coord_key(x : int, y : int) -> String:
	return "%d,%d" % [x, y]

func print():
	for key in grid.keys():
		print_debug("G(%s): %s" % [key, grid[key].to_s()])
