M83 ;Relative extrusion
G1 E-2 F3600 ;Retract filament 2mm
G91 ;Relative motion
G1 Z5 F6000 ;Move Z up 5mm
G90 ;Absolute motion
G1 X5 Y5 F9000 ;Move the printhead to position for filament swap/away from print

M291 P"Continue by changing filament?" R"Pressing OK will retract the filament and disable the motors" S3 ;Wait for response wether filament needs to be changed or not
G1 E-3 F3600  ; extract filament to cold end area
G4 P3000      ; wait for three seconds
G1 E5 F3600   ; push back the filament to smash any stringing
G1 E-15 F3600 ; extract back fast in to the cold zone
G1 E-130 F300 ; continue extraction slowly, allow the filament time to cool solid before it reaches the gears
M400          ; wait for moves to complete
M18 E0 ;Disable extruder motor