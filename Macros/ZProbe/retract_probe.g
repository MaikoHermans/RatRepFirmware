; Command to retract the probe
if global.probe_type == 0 ; Retract the probe for the BLTouch
	M98 P"/macros/ZProbe/BLTouch/retractprobe.g"