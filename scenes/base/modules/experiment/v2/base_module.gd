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
var rarity = RARITY.COMMON # convert to enum later on
var level = 1
var main_stat = [STAT_TYPE.CRIT_RATE, 10] # stat_type (enum), stat_value (int)

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
