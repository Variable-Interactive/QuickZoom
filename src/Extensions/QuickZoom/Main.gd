extends Node

@onready var extension_api: Node  ## A variable for easy reference to the Api

var zoom_slider

## This script acts as a setup for the extension
func _enter_tree() -> void:
	# NOTE: Use get_node_or_null("/root/ExtensionsApi") to access api.
	# NOTE: See https://www.oramainteractive.com/Pixelorama-Docs/extension_system/extension_api for
	# detailed documentation.
	extension_api = get_node_or_null("/root/ExtensionsApi")
	# |==== Your code goes here ====|
	zoom_slider = extension_api.general.get_global().camera.zoom_slider
	# |=============================|

func _input(event: InputEvent) -> void:
	if !zoom_slider:
		return
	if event is InputEventKey:
		match event.keycode:
			KEY_0:
				extension_api.general.get_global().camera.fit_to_frame(
					extension_api.project.current_project.size
				)
			KEY_1:
				zoom_slider.value = 100
			KEY_2:
				zoom_slider.value = 200
			KEY_3:
				zoom_slider.value = 300
			KEY_4:
				zoom_slider.value = 400
			KEY_5:
				zoom_slider.value = 500
			KEY_6:
				zoom_slider.value = 600
			KEY_7:
				zoom_slider.value = 700
			KEY_8:
				zoom_slider.value = 800
			KEY_9:
				zoom_slider.value = 900



## Gets called when the extension is being disabled or uninstalled (while enabled).
func _exit_tree() -> void:
	# Remember to remove things that you added using this extension
	# Disconnect any signals and queue_free() any nodes that got added.
	pass  ## Replace with your code
