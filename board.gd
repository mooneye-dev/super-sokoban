extends Node3D

var GameGrid = load("res://game_grid.gd")

var grid : GameGrid
var player_piece : PlayerPiece

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grid = GameGrid.new()
	for child in find_children("*", "GamePiece"):
		var piece = child as GamePiece
		if piece is PlayerPiece:
			player_piece = piece as PlayerPiece
		var x = floori(piece.position.x + 0.4999)
		var y = floori(0.49999 - piece.position.z)
		grid.put(x, y, piece)
		piece.reposition()
		print_debug("Found piece: %s at %d, %d" % [piece.name, x, y])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_left"):
		player_piece.move_left()
	if Input.is_action_just_pressed("move_right"):
		player_piece.move_right()
	if Input.is_action_just_pressed("move_up"):
		player_piece.move_up()
	if Input.is_action_just_pressed("move_down"):
		player_piece.move_down()
	pass
