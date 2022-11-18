; Move to load the klicky onto the eva tool

M98 P"/macros/ZProbe/Klicky/klicky_status.g"				; Check the probe's current status

; Check if the status for klicky is already attached
if global.klicky_status != "attached"
	M98 P"/macros/Predefined Locations/klicky_location.g" 	; Move to pick up the probe
	G91														; Switch to relative positioning
	G1 X-60 F99999											; Move X to 0
	G1 X60 F99999											; Move X to 60
	G90														; Switch to absolute positioning
	M400													; Wait for all moves to be completed
	
	M98 P"/macros/ZProbe/Klicky/klicky_status.g"			; Check for probe status
	echo sensors.probes[0].value[0]							; Show the probe status

if global.klicky_status = "attached"						; Check for the status and make sure it's attached
		echo "Probe ATTACHED"
else
	echo "Error probe not attached - aborting"				; Abort running task if probe isn't attached successfuly
	abort