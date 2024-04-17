extends Node

var is_dragging = false

signal open_panel

#PAUSE
signal just_paused
signal just_unpaused

var _paused:bool = false;
var paused:bool = false :
	set (value):
		if (not value == _paused):
			_paused = value;
			if value:
				just_paused.emit()
			else:
				just_unpaused.emit();
			
	get:
		return _paused;
