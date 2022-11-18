M98 P{global.probePhysicalLoad}					; Attach the probe physically if required

G91               								; relative positioning
G1 H2 Z5 F6000    								; lift Z relative to current position
G90               								; absolute positioning
M98 P{global.locationProbeCenter}				; go to the center of the bed
G30               								; home Z by probing the bed

M98 P{global.probePhysicalUnload}				; Detach the probe physically if required