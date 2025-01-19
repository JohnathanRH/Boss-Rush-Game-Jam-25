extends Node

@export var slug : Boss
@export var nav_agent : BossNav
@onready var map = get_tree().get_nodes_in_group("map")

func _on_rate_timeout() -> void:
	var shot = load("res://tscn/bosses/slug/raindrop.tscn").instantiate() as RainDrop 
	shot.position = Vector2(slug.player.position.x, slug.player.position.y)
	map[0].add_child(shot)
