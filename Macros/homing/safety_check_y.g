if !move.axes[1].homed
	echo "Y is not homed yet, homing y first"
	M98 P"/macros/homing/home_y.g" ; Homing Y

if move.axes[1].machinePosition < 20
	echo "Moving Y into a safe position"
	G1 Y25 F6000		; Move Y into safe position before homing X