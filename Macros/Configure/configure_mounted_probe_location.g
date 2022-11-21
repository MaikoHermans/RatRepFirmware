; This file will help you set the location for a dockable probe.
 
; Warn the user about the retract & deploy files being overwritten
M291 P"Continuing will overwrite deployprobe.g & retractprobe.g" R"Are you sure you want to continue?" S3
if global.probe_type == 0 ; Probe type is set to something that doesn't need to be loaded
    abort "The probe is set to a type that doesn't support loading. Change the probe_type in 'sys/lib/globals/printer_specific_config.g"
 
M564 H0	; Allow movement without homing in order to move Z
 
; If the printer hasn't been homed, home it
if !move.axes[0].homed || !move.axes[1].homed
	G28 XY
 
G91 ; Set to relative mode
G1 Z10 ; if axes homed move the bed out of the way
G90 ; Set to absolute mode
 
M561    ; Clear any bed transform
M290 R0 S0 ; clear babystepping
 
if sensors.probes[0].value[0] = 1000
    M291 P"Make sure the klicky probe is mounted on the toolhead" S3
    if sensors.probes[0].value[0] = 1000
		M564 H1	; Don't allow movement without homing
        abort "The probe doesn't seem to be attached, please attach before starting the configuration again"
 
; Display the popup to jog the tool to the spot where the klicky is in the dock
M291 R"Move klicky to it's docking location" P"Press OK when the probe seated in the dock" S3 X1 Y1
var probeDockXLocation = move.axes[0].machinePosition   ; Store the position of X when docked
var probeDockYLocation = move.axes[1].machinePosition   ; Store the position of Y when docked
 
; Display the popup to jog the tool in order to "mount" the probe
M291 R"Move the tool to pull the probe from the dock" P"Press ok when the tool is in a position you like it to be" S3 X1 Y1
var probeAttachedXLocation = move.axes[0].machinePosition   ; Store the position of X when attached
var probeAttachedYLocation = move.axes[1].machinePosition   ; Store the position of Y when attached
 
; Lets verify that we can move into the probe location before continuing
while iterations < 3
    G0 X{var.probeDockXLocation} Y{var.probeDockYLocation}
    M400    ; Wait for all moves to be completed
    if sensors.probes[0].value[0] = 1000
		M564 H1	; Don't allow movement without homing
        abort "The probe was detached, please start again"
    G0 X{var.probeAttachedXLocation} Y{var.probeAttachedYLocation}
    M400    ; Wait for all moves to be completed
    if sensors.probes[0].value[0] = 1000
		M564 H1	; Don't allow movement without homing
        abort "The probe was detached, please start again"
 
; Lets make sure we are in the docked position
G0 X{var.probeDockXLocation} Y{var.probeDockYLocation}
M400    ; Wait for all moves to be completed
if sensors.probes[0].value[0] = 1000
	M564 H1	; Don't allow movement without homing
    abort "The probe was detached, please start again"
 
; Display the popup to jog the tool in order to "detach" the probe
M291 R"Move the tool in order to detach the probe" P"Press ok when the probe is in a position where you would like it to be after detaching the probe" S3 X1 Y1
var probeDetachedXLocation = move.axes[0].machinePosition   ; Store the position of X when attached
var probeDetachedYLocation = move.axes[1].machinePosition   ; Store the position of Y when attached
 
; Lets verify that we can attach and detach the probe
while iterations < 3
    G0 X{var.probeAttachedXLocation} Y{var.probeAttachedYLocation}  ; Move to attach the probe
    G0 X{var.probeDockXLocation} Y{var.probeDockYLocation}  ; Move into position to attach the probe
    G0 X{var.probeAttachedXLocation} Y{var.probeAttachedYLocation}  ; Move to attach the probe
    G0 X{var.probeDockXLocation} Y{var.probeDockYLocation}  ; Move into position to attach the probe
    M400    ; Wait for all moves to be completed
    if sensors.probes[0].value[0] = 1000
		M564 H1	; Don't allow movement without homing
        abort "The probe wasn't mounted, please start again"
    G0 X{var.probeDetachedXLocation} Y{var.probeDetachedYLocation}  ; Move to detach the probe
    M400    ; Wait for all moves to be completed
    if sensors.probes[0].value[0] = 0
		M564 H1	; Don't allow movement without homing
        abort "The probe wasn't detached, please start again"
 
echo > "/sys/G28.1.g" "; The homing command for Z when using a dockable probe" ; Let's create the homing file for dockable probes
echo >> "/sys/G28.1.g" "var mode = {param.S} ; The variable for the loading or unloading"
echo >> "/sys/G28.1.g" "if var.mode = 0 ; Load the probe"
echo >> "/sys/G28.1.g" "    if sensors.probes[0].value[0] != 0"
echo >> "/sys/G28.1.g" "        G1 X" ^ {var.probeAttachedXLocation}, "Y" ^ {var.probeAttachedYLocation}, "F999999 ; Move tool in front of dock"
echo >> "/sys/G28.1.g" "        G1 X" ^ {var.probeDockXLocation}, "Y" ^ {var.probeDockYLocation}, "F999999 ; Move tool in position where probe is mounted"
echo >> "/sys/G28.1.g" "        G1 X" ^ {var.probeAttachedXLocation}, "Y" ^ {var.probeAttachedYLocation}, "F999999 ; Move tool in front of dock"
echo >> "/sys/G28.1.g" "        M400"
echo >> "/sys/G28.1.g" "    if sensors.probes[0].value[0] != 0"
echo >> "/sys/G28.1.g" "        abort ""Error probe not attached - aborting"""
echo >> "/sys/G28.1.g" ""
echo >> "/sys/G28.1.g" "if var.mode = 1 ; unload the probe"
echo >> "/sys/G28.1.g" "    if sensors.probes[0].value[0] != 1000"
echo >> "/sys/G28.1.g" "        G90"
echo >> "/sys/G28.1.g" "        G1 X" ^ {var.probeAttachedXLocation}, "Y" ^ {var.probeAttachedYLocation}, "F999999 ; Move tool in front of dock"
echo >> "/sys/G28.1.g" "        M400"
echo >> "/sys/G28.1.g" "        G1 X" ^ {var.probeDockXLocation}, "Y" ^ {var.probeDockYLocation}, "F999999 ; Move tool in position where probe is mounted"
echo >> "/sys/G28.1.g" "        G1 X" ^ {var.probeDetachedXLocation}, "Y" ^ {var.probeDetachedYLocation}, "F999999 ; Move tool to detach probe"
echo >> "/sys/G28.1.g" "        G1 X" ^ {var.probeAttachedXLocation}, "Y" ^ {var.probeAttachedYLocation}, "F999999 ; Move tool in front of dock"
echo >> "/sys/G28.1.g" "        M400"
echo >> "/sys/G28.1.g" "    if sensors.probes[0].value[0] != 1000"
echo >> "/sys/G28.1.g" "        abort ""Error probe not docked - aborting"""
 
echo "configured the location"
