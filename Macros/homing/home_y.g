;; For homing X, perform a double-tap to locate the endstop.
;; First move fast to save time, then move slow for precision.
;;
;; *ADJUST* based on your X size as indicated below

G91										; relative positioning
G1 H1 Y{move.axes[1].max} F6000			; +Y probe move, fast. (*ADJUST* to 5mm larger than your Y size)
G1 Y-5 F6000							; back off from the endstop
G1 H1 Y{move.axes[1].max} F360			; +Y probe move, slow
G1 Y-10 F6000							; Move y to save position