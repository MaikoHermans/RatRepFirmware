; Command to deploy the probe for Z moves that require probing
if global.probe_type == 0 ; Deploy probe for BLTouch
	M98 P"/macros/ZProbe/BLTouch/deployprobe.g"