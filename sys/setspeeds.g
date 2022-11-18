; setspeeds.g
; called to set speed and acceleration

M566 X300.00 Y300.00 Z6.00 E120.00 P1      ; set maximum instantaneous speed changes (mm/min) and jerk policy
M203 X10800.00 Y10800.00 Z600.00 E3600.00 ; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z100.00 E3600.00    ; set accelerations (mm/s^2)