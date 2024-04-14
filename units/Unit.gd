class_name Unit
extends CharacterBody2D

@onready var collision:Area2D = $Area2D
@onready var collision_shape:CollisionShape2D = $CollisionShape2D
@onready var animated_sp:AnimatedSprite2D = $AnimatedSprite2D;

@export var _opponent:PackedScene;
@export var _direction: Vector2 = Vector2.UP;
@export var _speed: int = 30;

func _is_opponent(area) -> bool:
	return true;

func _ready():
	collision.body_entered.connect(_on_body_entered);
	animated_sp.animation_finished.connect(_on_death);
	
func _on_body_entered(area):
	if _is_opponent(area):
		animated_sp.play("fall");
		_speed = 0;

func _on_death():
	print("ON DEATH ", self)
	animated_sp.animation_looped.disconnect(_on_death);
	animated_sp.stop();
	queue_free();
	
func _physics_process(_delta):
	if Globals.paused:
		return;
	
	velocity = _direction * _speed
	move_and_slide()
