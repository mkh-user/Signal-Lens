@tool
class_name SignalLensSettings
extends Node

const PREFIX = "debugger/signal_lens/"

const SETTINGS = [
	{
		"name": "connection_opacity",
		"type": TYPE_FLOAT,
		"hint": PROPERTY_HINT_RANGE,
		"hint_string": "0,100",
		"defalut_value": 30,
	}
]

var Setting = EditorInterface.get_editor_settings()

static var setting_dict: Dictionary

func _enter_tree() -> void:
	Setting.settings_changed.connect(_apply_settings)
	var info
	for item in SETTINGS:
		if Setting.has_setting(PREFIX + item.name): continue
		Setting.set_setting(PREFIX + item.name, item.defalut_value)
		info = item.duplicate()
		info.name = PREFIX + info.name
		Setting.add_property_info(info)
		setting_dict[item.name] = item.defalut_value

func _exit_tree() -> void:
	for item in SETTINGS:
		if Setting.has_setting(PREFIX + item.name):
			Setting.erase(PREFIX + item.name)

func _apply_settings() -> void:
	if not Setting.check_changed_settings_in_group(PREFIX): return
	for item in SETTINGS:
		setting_dict[item.name] = Setting.get_setting(PREFIX + item.name)

static func get_setting(key: String) -> Variant:
	return setting_dict[key]
