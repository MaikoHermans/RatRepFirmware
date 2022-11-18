; Setup the probe details for the BLTouch

M950 S0 C"121.io0.out"                     ; Create a servo pin on io0
M558 P9 C"121.io0.in" H5 F240 T10800 A5    ; set Z probe type to unmodulated and the dive height + speeds
G31 P25 X-28.00 Y-13.00 Z3.05          	   ; set Z probe trigger value, offset and trigger height, more Z means closer to the bed