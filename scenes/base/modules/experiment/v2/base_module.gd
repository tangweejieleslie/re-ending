extends Resource

class_name BaseModule

enum MODULE_SET { SWIFT, FATAL, DESPAIR, WILL}
enum RARITY {COMMON, UNCOMMON, RARE, EPIC, LEGENDARY, MYTHIC}
enum STAT_TYPE {CRIT_RATE, CRIT_DMG, ATK_P, ATK, DEF_P, DEF, HP_P, HP, ACC, RES, SPD}

const STAT_TYPE_NAME = [
	"Critical Rate",
	"Critical Damage",
	"Attack Percent",
	"Attack",
	"Defense Percent",
	"Defense",
	"HP Percent",
	"HP",
	"Accuracy",
	"Resistance",
	"Speed"
]

# Module Structure
var acquisition_time
var id
var module_set = MODULE_SET.SWIFT
var set_bonus = 1
const MAX_SET_BONUS = 4
var rarity = RARITY.COMMON # convert to enum later on
var level = 1
var main_stat = [STAT_TYPE.CRIT_RATE, 10] # stat_type (enum), stat_value (int)
var slot = 1 # 

var sub_stats = {
	STAT_TYPE.CRIT_RATE: [0,0], # stat, powerups
	STAT_TYPE.CRIT_DMG: [0,0], # stat, powerups
	STAT_TYPE.ATK_P: [0,0], # stat, powerups
	STAT_TYPE.ATK: [0,0], # stat, powerups
	STAT_TYPE.DEF_P: [0,0], # stat, powerups
	STAT_TYPE.DEF: [0,0], # stat, powerups
	STAT_TYPE.HP_P: [0,0], # stat, powerups
	STAT_TYPE.HP: [0,0], # stat, powerups
	STAT_TYPE.ACC: [0,0], # stat, powerups
	STAT_TYPE.RES: [0,0], # stat, powerups
	STAT_TYPE.SPD: [0,0], # stat, powerups
}

var equipped = {
	"story": 1, # content type, equipped unit ID
	"arena": 0,
	"dungeon": 0,
	"tower": 0
}


# Functions
# randomize module - for initialization
func randomize_module(available_sets, available_rarities, min_set_bonus):
	# These first 3 values varies depending on content type and difficulty
	module_set = available_sets[randi() % available_sets.size()]
	rarity = available_rarities[randi() % available_rarities.size()]
	set_bonus = randi_range(min_set_bonus,MAX_SET_BONUS) # set bonus goes up to 3 per module, not sure if this could give 0
	
	# These remaining values defers based on rarity 
	var available_stats = STAT_TYPE.values()
	var rand_main_stat_id = randi() % available_stats.size()
	main_stat[0] = available_stats[rand_main_stat_id]
	print("Main Stat Selected: ", STAT_TYPE_NAME[rand_main_stat_id])
	# need a lookup table for initial stat value based on rarity and stat_type 
	available_stats.remove_at(rand_main_stat_id)
	available_stats.shuffle()
	for i in range(randi_range(0,3)):
		var sub_stat_id = available_stats[i]
		print("Sub Stat Selected: ", STAT_TYPE_NAME[sub_stat_id])
	
	pass

func save_resource():
	pass
	
func powerup():
	pass
