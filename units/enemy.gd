class_name Enemy
extends Unit

func _is_opponent(area) -> bool:
	return area is Ally
