; This file contains the command names for macros.
; By setting them here they only need to be changed here whenever a file moves
; This makes maintainability a lot easier

; ===== Printer Size commands ====
global printerSizeConfig = "/sys/printer_size_config.g"

; ===== Probe commands =====
global probeInitialize = "/macros/ZProbe/initialize.g"
global probeDeploy = "/macros/ZProbe/deploy_probe.g"
global probeRetract = "/macros/ZProbe/retract_probe.g"
global probePhysicalLoad = "/macros/ZProbe/physical_load_probe.g"
global probePhysicalUnload = "/macros/ZProbe/physical_unload_probe.g"

; ===== Homing =====
global homingHomeIfNeeded = "/macros/homing/home_if_needed.g"
global homingHomeX = "/macros/homing/home_x.g"
global homingHomeY = "/macros/homing/home_y.g"
global homingSafetyCheckY = "/macros/homing/safety_check_y.g"

; ===== Location commands =====]
global locationBedCenter = "/macros/Predefined Locations/bed_center.g"
global locationProbeCenter = "/macros/Predefined Locations/probe_bed_center.g"
global locationInspectTool = "/macros/Predefined Locations/inspect_tool_location.g"