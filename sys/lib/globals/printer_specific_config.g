; In this file you can set all the relevant values to configure the firmware according to your needs
; !IMPORTANT!: When changing any value here, make sure to reset the board for the change to take effect!

; ======== Printer Size ========
; 0 = V-Core 3 - 200
; 1 = V-Core 3 - 300
; 2 = V-Core 3 - 400
; 3 = V-Core 3 - 500
if !exists(global.printer_size)	; Check if the global already exists, otherwise create/set it.
	global printer_size = 3

; ======== Probe Configuration ========
; 0 = BLTouch
; 1 = Klicky Probe

if !exists(global.probe_type)	; Check if the global already exists, otherwise create/set it.
	global probe_type = 1
	
	; Configure klicky status if probe is klicky
	if global.probe_type == 1 
		if !exists(global.klicky_status) ; Check if the global already exists, otherwise create/set it.
			global klicky_status = "none"

		; Print current global values
		echo "global.klicky_status defined. Value : " , global.klicky_status