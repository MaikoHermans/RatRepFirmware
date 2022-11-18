M290 R0 S0    ;  clear baby stepping
M561          ;  reset all bed adjustments
M400          ;  flush move queue

var probeAdditionalClearance = 5
var probeOffsetX = (sensors.probes[0].offsets[0] * -1) + var.probeAdditionalClearance
var probeOffsetY = (sensors.probes[0].offsets[1] * -1) + var.probeAdditionalClearance
 
M98 P{global.homingHomeIfNeeded}			; Make sure all axes are homed
  
M98 P{global.probePhysicalLoad}				; Attach the probe physically if required
 
while true
  if iterations = 5
    abort "Auto calibration repeated attempts ended, final deviation", move.calibration.final.deviation ^ "mm"
  G30 P0 X{var.probeOffsetX} Y{var.probeOffsetY} Z-99999 ; probe near a leadscrew
  if result != 0
    continue
  G30 P1 X{move.axes[0].max / 2} Y{move.axes[1].max - var.probeOffsetY} Z-99999 ; probe near a leadscrew
  if result != 0
    continue
  G30 P2 X{move.axes[0].max - var.probeOffsetX} Y{var.probeOffsetY} Z-99999 S3 ; probe near a leadscrew and calibrate 3 motors
  if result != 0
    continue
  if move.calibration.initial.deviation <= 0.01
    break
  echo "Repeating calibration because deviation is too high (" ^ move.calibration.initial.deviation ^ "mm)"
; end loop

echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"
G0 X{move.axes[0].max / 2} Y{move.axes[1].max / 2} Z10 F999999

; rehome Z as the absolute height of the z plane may have shifted
G28 Z

M98 P{global.probePhysicalUnload} ; Remove the probe physically if required