extends Control

# UI Reference
@onready var MAIN_STAT = $ModuleContainer/MainStat
@onready var SUB_STAT_A = $ModuleContainer/Substats/StatContainer
@onready var SUB_STAT_B = $ModuleContainer/Substats/StatContainer2
@onready var SUB_STAT_C = $ModuleContainer/Substats/StatContainer3
@onready var SUB_STAT_D = $ModuleContainer/Substats/StatContainer4

@onready var STATS_REFERENCES = [
	MAIN_STAT,
	SUB_STAT_A,
	SUB_STAT_B,
	SUB_STAT_C,
	SUB_STAT_D
]

# Module Constants
const stats = [
	"CRIT DMG", "CRIT Rate", 
	"ATK Percent", "ATK",
	"HP Percent", "HP",
	"DEF Percent", "DEF",
	"ACC", "RES",
	"SPD"
]

# Module Metadata - to refactor into resources later on
var module_stats = []

func _ready() -> void:
	pass

func randomize_stats():
	module_stats = []
	var s = stats.duplicate()
	s.shuffle()
	var random_number = randi_range(1, 5)
	for i in range(5):
		print(i)
		module_stats.append(s[i])
		if i < random_number:
			STATS_REFERENCES[i].update_label(s[i])
			STATS_REFERENCES[i].toggle_visibility(true)
		else:
			STATS_REFERENCES[i].toggle_visibility(false)
	
	print(module_stats)

func _on_upgrade_pressed() -> void:
	randomize_stats()
	pass # Replace with function body.
