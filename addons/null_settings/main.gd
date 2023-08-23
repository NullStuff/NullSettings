@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("Setting", "Node", preload("./scripts/setting.gd"), preload("./assets/Setting.svg"))
	add_custom_type("SettingsGroup", "Setting", preload("./scripts/settings_group.gd"), preload("./assets/Settings Group.svg"))
	add_custom_type("SettingsFile", "SettingsGroup", preload("./scripts/settings_file.gd"), preload("./assets/Settings Main.svg"))


func _exit_tree():
	remove_custom_type("Setting")
	remove_custom_type("SettingsGroup")
	remove_custom_type("SettingsFile")