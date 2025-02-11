extends GamePiece

class_name PlayerPiece

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func move(dx : int, dy : int):
	var target = Vector2i(x + dx, y + dy)	
	
	if grid.is_empty(target.x, target.y):
		grid.move_stack(x, y, target.x, target.y)
		x = target.x
		y = target.y
		reposition()
	else:
		var other_stack = grid.stack_at(target.x, target.y)
		if other_stack.is_movable(dx, dy):
			other_stack.move(dx, dy)
			grid.move_stack(x, y, target.x, target.y)
			x = target.x
			y = target.y
			reposition()
		pass
		#var other_piece : GamePiece = grid.at(target_x, target_y)
		#if other_piece.valid_move(dx, dy):
			#other_piece.move(dx, dy)
			#super.move(dx, dy)
