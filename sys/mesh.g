; Used when running G29 to create a mesh of the bed

M98 P{global.homingHomeIfNeeded}				; Make sure all axis are homed
M561											; Clear bed transform
G29 S2											; Disable the current mesh
M98 P{global.probePhysicalLoad}					; Attach the probe physically if required
G29 S0											; Probe the bed to create a mesh
M400                                    		; Wait for all moves to be completed
M376 H10										; Set taper 10mm
M98 P{global.probePhysicalUnload}				; Detach the probe physically if required