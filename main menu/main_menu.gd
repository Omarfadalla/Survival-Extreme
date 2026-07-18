extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options: Panel = $Options
 

func _ready() -> void:
	main_buttons.visible = true
	options.visible = false
	
	
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Game/game.tscn")
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	main_buttons.visible = false
	options.visible = true
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_back_options_pressed() -> void:
	_ready()
	pass # Replace with function body.
	
