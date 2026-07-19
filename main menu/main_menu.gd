extends Control

@onready var options: TextureRect = $Options
@onready var ExitButton: TextureButton = $MainButtons/ExitButton
@onready var StartGameButton: TextureButton = $MainButtons/StartGameButton
@onready var OptionsButton: TextureButton = $MainButtons/OptionsButton

func _ready() -> void:
	options.visible = false
	StartGameButton.visible = true
	OptionsButton.visible = true
	ExitButton.visible = true
	pass

func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game/game.tscn")
	pass # Replace with function body.

func _on_options_button_pressed() -> void:
	options.visible = true
	StartGameButton.visible = false
	OptionsButton.visible = false
	ExitButton.visible = false
	pass # Replace with function body.

func _on_exit_button_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_back_button_pressed() -> void:
	_ready()
	pass # Replace with function body.
