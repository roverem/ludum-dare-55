extends Node2D

@onready var panel = $Panel

var current_spawner:Spawner

func _ready():
	panel.confirm_spawn.connect(_on_spawn);
	Globals.open_panel.connect(_on_button)

func _on_button(_spawner:Spawner):
	Globals.paused = true;
	current_spawner = _spawner;
	panel.trigger_click(_spawner)

func _on_spawn():
	Globals.paused = false;
	current_spawner.spawn_unit();
