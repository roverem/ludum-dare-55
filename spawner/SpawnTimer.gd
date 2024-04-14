class_name SpawnerTimer
extends Spawner

@onready var spawn_timer:Timer = $Timer;
@onready var spawn_waiting_time:int = 3
@onready var max_random_wait_time:int = 1;

func _ready():
	
	var wait_time = clamp( randf() * 2, 1, 2 );
	spawn_timer.wait_time = wait_time
	spawn_timer.stop()
	spawn_timer.start()	
	spawn_timer.timeout.connect(_trigger_spawn_unit);
	
	Globals.just_paused.connect(_on_just_paused);
	Globals.just_unpaused.connect(_on_just_unpaused);
	
func _on_just_paused():
	spawn_timer.stop();
	
func _on_just_unpaused():
	spawn_timer.start();
	
func _trigger_spawn_unit():
	max_random_wait_time = clamp( randf() * 5, 0, max_random_wait_time );
	print("SPAWNING UNIT ", spawn_timer.wait_time + max_random_wait_time)
	spawn_timer.wait_time = spawn_waiting_time + max_random_wait_time;
	_spawn_unit();
	spawn_timer.stop()
	spawn_timer.start()

func _process(_delta):
	pass
