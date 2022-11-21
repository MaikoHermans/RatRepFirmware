; The homing command for Z when using a dockable probe
var mode = {param.S} ; The variable for the loading or unloading
var preloadX = 60
var preloadY = 4
var loadX = 10
var unloadY = 30
if var.mode = 0 ; Load the probe
    if sensors.probes[0].value[0] != 0
		G1 X{var.preloadX} Y{var.preloadY} F999999
		G1 X{var.loadX} F999999
		G1 X{var.preloadX} F999999
        M400
    if sensors.probes[0].value[0] != 0
        abort "Error probe not attached - aborting"

if var.mode = 1 ; unload the probe
    if sensors.probes[0].value[0] != 1000
        G90
		G1 X{var.preloadX} Y{var.preloadY} F999999
        M400
		G1 X{var.loadX} F999999
		G1 Y{var.unloadY} F999999
		G1 X{var.preloadX} Y{var.preloadY} F999999
        M400
    if sensors.probes[0].value[0] != 1000
        abort "Error probe not docked - aborting"
