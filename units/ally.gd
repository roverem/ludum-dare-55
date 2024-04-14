class_name Ally
extends Unit


func _is_opponent(area) -> bool:
	return area is Enemy
