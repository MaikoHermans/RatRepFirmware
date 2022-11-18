if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
	echo "not all axes homed, homing axes first"
	G28