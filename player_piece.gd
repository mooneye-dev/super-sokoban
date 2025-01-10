extends GamePiece

class_name PlayerPiece

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func move(dx : int, dy : int):
	var target_x = self.x + dx
	var target_y = self.y + dy
	if grid.empty(target_x, target_y):
		super.move(dx, dy)
	else:
		var other_piece : GamePiece = grid.at(target_x, target_y)
		if other_piece.valid_move(dx, dy):
			other_piece.move(dx, dy)
			super.move(dx, dy)
