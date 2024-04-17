class_name SpawnDemand
extends Spawner

@onready var button:Button = $Button;

func _ready():
	button.pressed.connect(_on_pressed)

func _on_pressed():
	Globals.open_panel.emit(self)
