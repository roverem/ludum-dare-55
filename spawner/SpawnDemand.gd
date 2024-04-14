class_name Spawner
extends Node2D

@export var spawn_units: Array[PackedScene];

func _spawn_unit():
	add_child(spawn_units[0].instantiate() );
