extends Node2D

@export var rooms_paths: Array[String]
@export var room_count: int

@onready var tile_map: TileMap = $TileMap

func _ready() -> void:
	generate_floor()
#	var room: TileMapPattern = choose_room()
#	set_room(0, Vector2i.ZERO, room)

func generate_floor() -> void:
	var new_room_pat: TileMapPattern
	var coords: Vector2i = Vector2i.ZERO
	var step_h: int = 18
	var step_v: int = 10
	
	for room in room_count:
		var direction: int
		direction = randi() % 4
		
		new_room_pat = choose_room()
		set_room(0, coords, new_room_pat)
		
		match direction:
			0:
				coords.x += step_h
			1:
				coords.x -= step_h
			2:
				coords.y += step_v
			3:
				coords.y -= step_v

func choose_room() -> TileMapPattern:
	var room_path: String
	var room: Node2D
	var tile_pattetn: TileMapPattern
	var coords: Array[Vector2i]
	
	room_path = rooms_paths[randi() % rooms_paths.size()]
	room = load(room_path).instantiate()
	coords = room.get_node("TileMap").get_used_cells(0)
	tile_pattetn = room.get_node("TileMap").get_pattern(0, coords)
	
	return tile_pattetn

func set_room(layer: int, coords: Vector2i, room: TileMapPattern) -> void:
	tile_map.set_pattern(layer, coords, room)
