extends Node2D

signal button_clicked
signal confirm_spawn

@onready var left_btn:Button = $LeftButton;
@onready var center_btn:Button = $CenterButton;
@onready var right_btn:Button = $RightButton;

@onready var _stones:Stones = $Stones;
@onready var _rune:Rune = $Rune

var current_lines:Array[PackedScene];

@export var _left_spawner: Spawner;
@export var _center_spawner: Spawner;
@export var _right_spawner: Spawner;

@export var _stone_1:Stone;
@export var _stone_2:Stone;
@export var _stone_3:Stone;

func _ready():
	left_btn.button_down.connect(_on_left_btn);
	center_btn.button_down.connect(_on_center_btn);
	right_btn.button_down.connect(_on_right_btn);
	_stones.visible = false;
	_rune.visible = false;
	
	_stone_1.dropped.connect(_on_dropped)
	_stone_2.dropped.connect(_on_dropped)
	_stone_3.dropped.connect(_on_dropped)
	
	current_lines = []

func _on_dropped(line:PackedScene):
	
	current_lines.append(line);
	_rune.add_line(line)
	
	if _rune.is_spawning:
		confirm_spawn.emit();
		_show_buttons();
		_reset();

func _reset():
	_rune.reset();
	current_lines = [];

func _on_left_btn():
	_trigger_click(_left_spawner);
	
func _on_center_btn():
	_trigger_click(_center_spawner)
	
func _on_right_btn():
	_trigger_click(_right_spawner);
	
func _trigger_click(spawner:Spawner):
	button_clicked.emit(spawner);
	_stones.visible = true;
	_rune.visible = true;
	_hide_buttons()

func _hide_buttons():
	left_btn.visible = false;
	center_btn.visible = false;
	right_btn.visible = false;
	_stones.visible = true;
	_rune.visible = true;

func _show_buttons():
	left_btn.visible = true;
	center_btn.visible = true;
	right_btn.visible = true;
	_stones.visible = false;
	_rune.visible = false;
