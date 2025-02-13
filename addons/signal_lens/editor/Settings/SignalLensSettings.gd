@tool
class_name SignalLensSettings
extends Node

const PREFIX = "debugger/signal_lens/"

const SETTINGS = {}

var Setting = EditorInterface.get_editor_settings()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Setting.set_setting("debugger/signal_lens/test", "For Test!")
	printerr(Setting.get_setting("debugger/signal_lens/test"))

func _exit_tree() -> void:
	Setting.erase("debugger/signal_lens/test")
