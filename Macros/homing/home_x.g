;; For homing X, perform a double-tap to locate the endstop.
;; First move fast to save time, then move slow for precision.
;;

M98 P"/macros/homing/safety_check_y.g"	; Check if the y position is safe before homing x
G91                                    	; relative positioning
G1 H1 X{-move.axes[0].max} F6000        ; X probe move, fast.
G1 X10 F6000                      		; back off from the endstop
G1 H1 X-11 F360                        	; X probe move, slow