class_name Rune
extends Sprite2D

@onready var lines:Node2D = $LinesDrawing
@onready var lines_ref:Node2D = $LineReference

@export var curr_completed:RuneCompletedResource;

var line_instances:Array[PackedScene]

var is_spawning = false

func add_line(line:PackedScene):
	line_instances.append(line)
	var line_ins = line.instantiate()
	lines.add_child(line_ins)
	_check_lines();
	
	
func _ready():
	print(curr_completed.all_lines.lines);
	print(curr_completed.completed)
	line_instances = []
	
	for linePack in curr_completed.completed:
		lines_ref.add_child( linePack.instantiate() )
	
	lines.scale = Vector2(2,2);

func _check_lines():
	#if lines.get_child_count() == 3:
	var matched:int = 0;
	var to_match:int = len(curr_completed.completed);
	
	for l in line_instances:
		var matches:bool = false;
		for i in curr_completed.completed:
			if l == i:
				matched += 1
	
	if matched == to_match:
		is_spawning = true

func reset():
	line_instances = [];
	for c in lines_ref.get_children():
		lines_ref.remove_child(c);
	for c2 in lines.get_children():
		lines.remove_child(c2)

	
