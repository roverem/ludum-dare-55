class_name Rune
extends Sprite2D

@onready var lines:Node2D = $Lines

var is_spawning = false

func add_line(line:Line2D):
	lines.add_child(line)
	if get_child_count() == 3:
		is_spawning = true
	
func _ready():
	lines.scale = Vector2(2,2);
	pass

func _process(delta):
	pass
