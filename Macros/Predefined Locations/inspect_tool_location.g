; Move the toolhead into a location where it can be easily inspected
; Makes it easier to do nozzle changes etc.

G1 X{move.axes[0].max / 2} Y{move.axes[1].min + 20} Z{move.axes[2].max * 0.2} F999999