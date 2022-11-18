M98 P{global.homingSafetyCheckY}		; Check if the y position is safe before homing x

G91               						; relative positioning
G1 H2 Z5 F6000         					; Lift Z relative to current position
G1 H1 X{-move.axes[0].max} F1800 		; move quickly to X axis endstop and stop there (first pass)
G1 X5 F6000    							; go back a few mm
G1 H1 X{-move.axes[0].max} F360  						; move slowly to X axis endstop once more (second pass)
G1 Z-5 F6000         					; Lower Z relative to current position
G90               						; absolute positioning
 
G1 X0 F6000