extends AnimatedSprite2D
class_name RainDrop

@export var animPlayer : AnimationPlayer
@export var killArea : Area2D
@export var damage : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$kill_area/CollisionShape2D.disabled = true
	animPlayer.animation_finished.connect(_on_animation_player_animation_finished)
	killArea.body_entered.connect(_on_kill_area_body_entered)
	animPlayer.play("shadow")

func _on_kill_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.emit_signal("damage", damage)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "shadow":
		animPlayer.play("impact")
	if anim_name == "impact":
		queue_free()
