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
	stats_name.CRIT_DAMAGE,
	stats_name.CRIT_RATE,
	stats_name.ATK_PERCENT,
	stats_name.DEF_PERCENT,
	stats_name.HP_PERCENT,
	stats_name.ACC,
	stats_name.RES,
	stats_name.SPEED
]

const stats_label = [
	"Crit. Damage",
	"Crit. Rate",
	"Attack",
	"Defense",
	"HP",
	"Accuracy",
	"Resistance",
	"Speed"
]



enum stats_name { CRIT_DAMAGE, CRIT_RATE, ATK_PERCENT, DEF_PERCENT, HP_PERCENT, ACC, RES, SPEED}
enum module_rarities {COMMON, RARE, UNIQUE, EPIC, LEGENDARY}
# Defines min. and max. rolls by rarity
# 95% to roll lower range, 5% to roll upper range
const sub_stat_range = [
	[[1,2],[1,2],[2,3],[3,4],[4,5]], # CDMG
	[[1,2],[1,2],[2,3],[3,4],[4,5]], # CRATE
	[[1,2],[2,3],[3,4],[4,5],[5,6]], # ATK_PERCENT
	[[1,2],[2,3],[3,4],[4,5],[5,6]], # HP_PERCENT
	[[1,2],[2,3],[3,4],[4,5],[5,6]], # DEF_PERCENT
	[[1,2],[2,3],[3,4],[4,5],[5,6]], # ACC
	[[1,2],[2,3],[3,4],[4,5],[5,6]], # RES
	[[1,2],[2,3],[3,4],[4,5],[5,6]], # SPEED
]
# Base and increment 
const main_stat_calculation = [
	[[3,1],[3,2],[4,2],[6,2],[9,3]], # CDMG
	[[1,1],[2,1],[3,2],[4,3],[6,3]], # CRATE
	[[3,1],[3,2],[4,2],[5,2],[8,3]], # ATK_PERCENT
	[[3,1],[3,2],[4,2],[5,2],[8,3]], # HP_PERCENT
	[[3,1],[3,2],[4,2],[5,2],[8,3]], # DEF_PERCENT
	[[3,1],[3,2],[4,2],[6,2],[12,3]], # ACC
	[[3,1],[3,2],[4,2],[6,2],[12,3]], # RES
	[[1,1],[2,1],[2,2],[3,2],[4,2]], # SPEED
]

# Module Metadata - to refactor into resources later on
# 
var module_stats = [
	# Main Stat [stat_enum, value]
	# Sub Stat A [stat_enum, value]
	# ...
]
var module_rarity = module_rarities.EPIC # 0: lowest 5: highest. need a formula for stat range across rarities
var module_slot # 1,2,3,4. 1,2,3 have fixed main stat. 4 have random main stat.
var module_level = 1 # up to 15

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
			if i == 0:
				var stat_value = main_stat_calculation[s[i]]
				STATS_REFERENCES[i].update_value(stat_value[module_rarity][0])
			else:
				var stat_value = sub_stat_range[s[i]]
				var random_float = randf()
				if random_float < 0.95: # check stats roll 
					STATS_REFERENCES[i].update_value(stat_value[module_rarity][0])
				else:
					STATS_REFERENCES[i].update_value(stat_value[module_rarity][1])
				
			STATS_REFERENCES[i].update_label(stats_label[s[i]])

			STATS_REFERENCES[i].toggle_visibility(true)
		else:
			STATS_REFERENCES[i].toggle_visibility(false)
	
	print(module_stats)

func _on_upgrade_pressed() -> void:
	randomize_stats()
	pass # Replace with function body.
