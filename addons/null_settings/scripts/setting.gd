extends Node
class_name Setting
## A node which manages a single setting. All settings nodes eventually inherit from this.
##
## This node emits a signal when a value is loaded so that other nodes like UI elements can handel
## that load, and a signal when it saves, which is used internally to communicate a save to your
## root node, like a SettingsFile, but can be used by other nodes or UI elements to check the current
## value saved in this setting.


## Emited when this setting has a new value stored.
signal value_loaded(new_value)
## Emited when this setting has a new value set and would like to save it to e.g. a file.
signal save(setting)


## The key of this setting. Settings will be saved and loaded based off of this key, so make sure it is unique at the current level! This key may be left blank in a settings group, although it is recommended not to leave it blank.
@export var _key: String = "";


var _value


func _ready():
	# print("Setting is ready! %s" % get_path())
	if _key == "":
		printerr("Setting '%s' has blank key. This may lead to undesireable behaviour, please specify a key." % get_path())


## Get the currently stored value of this setting.
func get_value():
	return _value


## Get the key this setting stores at.
func get_key():
	return _key


## Tell this setting to load a value. This is used internally and is not recommended if you want to change this setting's value programatically. Instead use save_value(new_value).
func load_value(new_value):
	_value = new_value
	value_loaded.emit(new_value)


## Save a new value in this setting. This will trigger a save in the root node, which should save the setting value permanently so it can be loaded next time the program starts.
func save_value(new_value):
	_value = new_value
	save.emit(self)


## Serialize the setting into a JSON style dictionary. SettingsGroup's will save all child keys, whereas a Setting will only save a single key/value pair.
func serialize():
	return {_key: _value}
