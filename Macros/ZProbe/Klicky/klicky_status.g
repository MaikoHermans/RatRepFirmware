; Check the current attached status of the klicky probe. 

; global.clicky_status
; = docked 
; = attached 

echo "Klicky trigger value : " , sensors.probes[0].value[0]

if sensors.probes[0].value[0] = 0
	set global.klicky_status = "attached"
elif sensors.probes[0].value[0] = 1000
	set global.klicky_status = "docked"