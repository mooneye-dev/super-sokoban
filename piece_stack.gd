extends Object

class_name PieceStack

var pieces : Array[GamePiece]
var grid : GameGrid
var x : int
var y : int

func _init(game_grid : GameGrid):
	pieces = []
	grid = game_grid
	
func push(piece : GamePiece):
	pieces.push_back(piece)
	
func top() -> GamePiece:
	return pieces.back()

func bottom() -> GamePiece:
	return pieces.front()
	
func at(i : int) -> GamePiece:
	return pieces[i]
	
func pop() -> GamePiece:
	return pieces.pop_back()
	
func size() -> int:
	return pieces.size()

func is_movable(dx : int, dy : int) -> bool:
	return false
	
func move(dx : int, dy : int):
	var target = Vector2i(self.x + dx, self.y + dy)
	if grid.is_empty(target.x, target.y):
		grid.move_stack(self.x, self.y, target.x, target.y)
		self.x = target.x
		self.y = target.y
		for piece in pieces:
			piece.x = target.x
			piece.y = target.y
		pass
	pass
	
func to_s() -> String:		
	return ", ".join(pieces.map(func(el): el.name))
