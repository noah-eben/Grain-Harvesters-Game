extends ParallaxLayer

@onready var cloudSpeed: float = -15

func _process(delta: float) -> void:
	self.motion_offset.x += cloudSpeed * delta
