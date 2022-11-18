; Setup the probe details for the Klicky probe

M558 P8 C"121.io0.in" I1 H2  R0.1 F240:60 T8000 A5 S0.01		; set Z probe type to unmodulated and the dive height + speeds
G31 P25 X-24.526 Y-20.725 Z3.29          	   					; set Z probe trigger value, offset and trigger height, more Z means closer to the bed