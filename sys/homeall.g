G91                     						; relative positioning
G1 H2 Z10 F6000         						; lift Z relative to current position
 
M98 P{global.homingHomeY}						; Home the y axis
M98 P{global.homingHomeX}						; Home the x axis

G90                     						; absolute positioning
M98 P{global.probePhysicalLoad}					; Attach the probe physically if required
M98 P{global.locationProbeCenter}				; Move to the center of the bed
G30                     						; home Z by probing the bed
M98 P{global.probePhysicalUnload}				; Detach the probe physically if required
 
G91                    							; relative positioning
G1 Z5 F1800            							; lift Z relative to current position
G90                    							; absolute positioning