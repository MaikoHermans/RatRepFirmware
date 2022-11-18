; Physically load the probe if required

if global.probe_type == 1	; Load the Klicky probe
	M98 P"/macros/ZProbe/Klicky/klicky_load.g"