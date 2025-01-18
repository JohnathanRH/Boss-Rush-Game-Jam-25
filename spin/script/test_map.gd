extends Node2D

# Chart of atlas coordinates of each tiles

var tileChart = {
	["Dirt","Dirt", "Dirt", "Grass"] : Vector2i(0,0),
	["Grass","Grass", "Dirt", "Dirt"] : Vector2i(4,0),
	["Grass","Dirt", "Grass", "Grass"] : Vector2i(8,0),
	["Grass","Dirt", "Dirt", "Grass"] : Vector2i(12,0),
	["Grass","Dirt", "Grass", "Dirt"] : Vector2i(0,4),
	["Grass","Grass", "Dirt", "Grass"] : Vector2i(4,4),
	["Grass","Grass", "Grass", "Grass"] : Vector2i(8,4),
	["Dirt","Grass", "Grass", "Grass"] : Vector2i(12,4),
	["Dirt","Grass", "Dirt", "Dirt"] : Vector2i(0,8),
	["Dirt", "Grass", "Grass", "Dirt"] : Vector2i(4,8),
	["Grass", "Grass", "Grass", "Dirt"] : Vector2i(8,8),
	["Dirt", "Dirt", "Grass", "Grass"] : Vector2i(12,8),
	["Dirt", "Dirt", "Dirt", "Dirt"] : Vector2i(0,12),
	["Grass", "Dirt", "Dirt", "Dirt"] : Vector2i(4,12),
	["Dirt", "Grass", "Dirt", "Grass"] : Vector2i(8,12),
	["Dirt", "Dirt", "Grass", "Dirt"] : Vector2i(12,12),
}

func _ready() -> void:
	# Match the tiles
	for i in $Display.get_used_cells():
		$Display.set_cell(i, 1,tileChart[[getTileType(i), getTileType(i+Vector2i(0,-1)), getTileType(i + Vector2i(-1,-1)), getTileType(i + Vector2i(-1,0))]])

func getTileType(coord : Vector2i):
	var tileAtlas : Vector2i = $GroundData.get_cell_atlas_coords(coord)
	if tileAtlas == Vector2i(8,4):
		return "Grass"
	else:
		return "Dirt"
