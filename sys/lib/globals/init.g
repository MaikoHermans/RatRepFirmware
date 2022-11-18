; Initialize all relevant globals

if !exists(global.initialized) ; Check if the initiliazed global exists, which soley exists for this purpose
	M98 P"/sys/lib/globals/command_names.g"	; Initialize the command names to be used throughout the firmware
	M98 P"/sys/lib/globals/printer_specific_config.g" ; Initialize the globals that contain settings which apply to the printer
	M98 P"/sys/lib/globals/set_board_specifications.g"	; Initialize the globals that are used to configure board relevant settings.
	global initialized = true	; Set initialized to true so values aren't recreated on config file changes. A reboot is required