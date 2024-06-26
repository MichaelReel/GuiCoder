@tool
extends PopupPanel

signal add_property(property_name: String)

@onready var property_name_field: LineEdit = $VBoxContainer/PropertyNameField

func _ready() -> void:
	_set_to_center()

func show_add() -> void:
	property_name_field.grab_focus()
	show()

func _set_to_center() -> void:
	position = (DisplayServer.window_get_size() / 2) - (size / 2)

func _close() -> void:
	visible = false

func _on_add_button_pressed() -> void:
	var propery_name: String = property_name_field.text.strip_edges()
	if propery_name:
		emit_signal("add_property", propery_name)
		property_name_field.text = ""
		_close()

func _on_cancel_button_pressed() -> void:
	_close()
