extends NavigationAgent2D

@onready var boss = self.get_parent() as Boss

func _physics_process(delta: float) -> void:
	var dir = boss.to_local(get_next_path_position()).normalized()
	boss.velocity = dir * boss.SPEED

func _on_rate_timeout() -> void:
	target_position = boss.player.global_position
