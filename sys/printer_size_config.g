; The settings which are specific to the size of the printer are being set here
; This includes settings for the 200 - 300 - 400 - 500.
; The printer size to use can be set in the "set_globals.g" file

var smallestSizeX = 210		; variable for the smallest x size of all printer sizes
var smallestSizeY = 208		; variable for the smallest y size of all printer sizes
var smallestSizeZ = 200		; variable for the smallest z size of all printer sizes

var additionalSize = 100 * global.printer_size		; The size that needs to be added to the smallest size to get the limits per machine
var XSize = var.smallestSizeX + var.additionalSize		; printers X size
var YSize = var.smallestSizeY + var.additionalSize		; printers Y size
var ZSize = var.smallestSizeZ + var.additionalSize		; printers Z size

M208 X0 Y0 Z0 S1 ; set axis minimum
M208 X{var.XSize} Y{var.YSize} Z{var.ZSize} S0  ; set axis maximum

if global.printer_size == 0 					; Set size settings corresponding with the 200
	M671 X-4.5:100:204.5 Y-4.5:205:-4.5 S15 	; define positions of Z leadscrews or bed levelling screws
	M557 X30:170 Y30:170 P7      				; define 7x7 mesh grid
	
if global.printer_size == 1 					; Set size settings corresponding with the 300
	M671 X-4.5:150:304.5 Y-4.5:305:-4.5 S15		; define positions of Z leadscrews or bed levelling screws
	M557 X30:270 Y30:270 P7      				; define 7x7 mesh grid

if global.printer_size == 2 					; Set size settings corresponding with the 400
	M671 X-4.5:200:404.5 Y-4.5:405:-4.5 S15    	; define positions of Z leadscrews or bed levelling screws
	M557 X30:370 Y30:370 P7      				; define 7x7 mesh grid
	
if global.printer_size == 3 					; Set size settings corresponding with the 500
	M671 X-4.5:250:504.5 Y-4.5:505:-4.5 S15		; define positions of Z leadscrews or bed levelling screws
	M557 X30:470 Y30:470 P7      				; define 7x7 mesh grid