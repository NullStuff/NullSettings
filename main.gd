@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("Setting", "Node", preload("./scripts/setting.gd"), preload("./assets/Setting.svg"))
	add_custom_type("SettingsGroup", "Setting", preload("./scripts/settings_group.gd"), preload("./assets/Settings Group.svg"))
	add_custom_type("SettingsFile", "SettingsGroup", preload("./scripts/settings_file.gd"), preload("./assets/Settings Main.svg"))

	# add_custom_type("CheckButtonSetting", "Setting", preload("./scenes/check_button_setting.tscn"), preload("./assets/Settings Main.svg"))
	# add_custom_type("FileDialogSetting", "SettingsGroup", preload("./scenes/file_dialog_setting.tscn"), preload("./assets/Settings Main.svg"))
	# add_custom_type("LineEditSetting", "Setting", preload("./scripts/settings_file.gd"), preload("./assets/Settings Main.svg"))
	# add_custom_type("OptionButtonSetting", "Setting", preload("./scripts/settings_file.gd"), preload("./assets/Settings Main.svg"))
	# add_custom_type("SettingLabel", "Setting", preload("./scripts/settings_file.gd"), preload("./assets/Settings Main.svg"))
	# add_custom_type("SpinBoxSetting", "Setting", preload("./scripts/settings_file.gd"), preload("./assets/Settings Main.svg"))


func _exit_tree():
	remove_custom_type("Setting")
	remove_custom_type("SettingsGroup")
	remove_custom_type("SettingsFile")