class_name Stone
extends Sprite2D

@export var line:PackedScene;
@export var dropable_area:Area2D

@onready var area:Area2D = $Area2D;

var _is_hover:bool;
var _is_dragging:bool;
var _is_inside_dropable:bool;

signal dropped

func _ready():
	add_child(line.instantiate())
	
	area.area_entered.connect(_on_body_entered)
	area.mouse_entered.connect(_on_mouse_enter)
	area.mouse_exited.connect(_on_mouse_exit)

func _process(delta):
	if _is_dragging:
		global_position = get_global_mouse_position();

func _on_body_entered(area):
	if area.is_in_group("dropable"):
		_is_inside_dropable = true;

func _on_mouse_exit():
	_is_hover = false
	scale = Vector2.ONE;
	
func _on_mouse_enter():
	_is_hover = true
	scale = Vector2(1.05, 1.05);

func _unhandled_input(event: InputEvent) -> void:
	var mouse_event:InputEventMouseButton;
	if event is InputEventMouseButton:
		mouse_event = event;
		
	if not mouse_event: 
		return
	
	if _is_hover and mouse_event.pressed and mouse_event.button_index == 1:
		_is_dragging = true;		
	else:
		_is_dragging = false;
		if _is_inside_dropable:
			dropped.emit(line);
			queue_free()
