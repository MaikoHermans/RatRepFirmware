; Dock the klicky probe 

M98 P"/macros/ZProbe/Klicky/klicky_status.g"				; Check the probe's current status
if global.klicky_status != "docked"							; Check if the probe isn't docked already
	echo "Docking Klicky Probe"				
	G90 													; Switch to Absolute positioning
	M98 P"/macros/Predefined Locations/klicky_location.g" 	; Move in front of probe dock
	M400 													; Wait for all moves to be completed
	G91 													; Switch to relative positioning
	G1 X-60 F99999 	 										; Move into the dock
	G1 Y30 F99999 											; Move to unhook probe
	G90 													; Switch to absolute positioning
	M98 P"/macros/Predefined Locations/klicky_location.g" 	; Move in front of probe dock
	M400													; Wait for all moves to be completed
	
	M98 P"/macros/ZProbe/Klicky/klicky_status.g"			; Check the probe's current status

if global.klicky_status = "docked"							; Check if the probe is docked
	echo "Probe is DOCKED"
else														; Abort the current action if the probe isn't docked correctly
	echo "Error probe not docked - aborting"
	abort