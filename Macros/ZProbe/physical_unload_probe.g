; Physically unload the probe if required

if global.probe_type == 1 	; Unload the klicky probe
	M98 P"/macros/ZProbe/Klicky/klicky_unload.g"