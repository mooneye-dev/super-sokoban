extends Node3D

var GameGrid = load("res://game_grid.gd")

var grid : GameGrid
var player_piece : PlayerPiece
@export var board_thickness : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grid = GameGrid.new()
	var pieces_to_insert = []
	for child in find_children("*", "GamePiece"):
		var piece = child as GamePiece
		if piece is PlayerPiece:
			player_piece = piece as PlayerPiece
		var piece_position = Vector3i(
			floori(piece.position.x + 0.4999),
			floori(0.4999 - piece.position.z),
			floori(0.4999 + piece.position.y)
		)		
		pieces_to_insert.push_back([piece_position, piece])
	
	pieces_to_insert.sort_custom(func(a, b):
		return a[0].z < b[0].z
	)
	for location_and_piece in pieces_to_insert:
		var location = location_and_piece[0]
		var piece = location_and_piece[1]
		grid.put_piece(location.x, location.y, piece)
		piece.reposition()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_left"):
		player_piece.move(-1, 0)
	if Input.is_action_just_pressed("move_right"):
		player_piece.move(1, 0)
	if Input.is_action_just_pressed("move_up"):
		player_piece.move(0, 1)
	if Input.is_action_just_pressed("move_down"):
		player_piece.move(0, -1)
	if Input.is_key_pressed(KEY_P):
		grid.print()
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit(0)
	pass
	
