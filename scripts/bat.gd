extends CharacterBody2D

@export var knock_back_speed := 125
@export	var air_friction := 100


func _physics_process(delta: float) -> void:
	self.velocity = self.velocity.move_toward(Vector2.ZERO, air_friction * delta)
	move_and_slide()


func _on_hurtbox_area_entered(area: Area2D):
	# being knocked back
	var parent := area.get_parent() as Node2D
	var direction = (self.global_position - parent.global_position).normalized()
	self.velocity = direction * knock_back_speed
