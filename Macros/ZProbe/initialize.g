if global.probe_type == 0 ; Set config values for the BLTouch 
	M98 P"/macros/ZProbe/BLTouch/initialize.g"

elif global.probe_type == 1 ; Set the config values for the Klicky probe
	M98 P"/macros/ZProbe/Klicky/initialize.g"
	