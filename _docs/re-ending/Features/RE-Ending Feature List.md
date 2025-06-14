
# Modules System

Reference: https://www.prydwen.gg/etheria-restart/guides/module-system 

1. Modules have different sets
2. Modules have different sub stats
3. Modules have different main stats
4. Modules have rarities
	1. rarities affect how much stats can be accumulated

![[Pasted image 20250614142442.png]]

prototype module data structure doesn't really support sorting. let's use a new DS that can sort easily. 

[[Module System Requirements]]

# Shell System

Reference: https://www.prydwen.gg/etheria-restart/guides/shell-system 



# Battle System

1. Active Turn Based Battle (attack bar accumulates, once it hit 100%, you take a turn. after taking a turn, ATB returns to 0)
	1. Attack bar gains at a rate based on speed
	2. 100 speed = 1% per tick
	3. 200 speed = 2% per tick


