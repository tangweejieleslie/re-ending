# User Stories

1. User can filter for modules by the following parameters (multiple selections - AND condition)
	1. Set
	2. Main Stat
	3. Sub Stat
2. User can sort modules by the following parameters
	1. acquisition time (default - newest first)
	2. sub stats (highest first)
	3. level (highest first)
3. When user clicks on a module, they can see the module details
	1. module set, image, main stat, substats, currently equipped by X
4. When user sees module details, they can powerup the module
5. Modules can go from level 1 to 15 (max)
6. Modules have different rarity (common, rare, epic, legendary, mythic)
	1. Different rarity modules have different stat limits
7. When a module is acquired, it will have a random set of stats
	1. Set bonus point (1,2,3) 
	2. Main stat (fixed for left side, random from right side)
	3. Sub stat(s)
		1. from 0 to 4
		2. not repeated from main stat
8. When a module is powered up, on every multiples of 3, it will gain an increment to a random substat
	1. if the module has less than 4 substats, it will unlock a new substat first



Draft - Lowfi Mockup

https://www.figma.com/design/oQSmcQBtrCIXkQrx7oYZSI/Untitled?node-id=1-3&t=Iuw7mKT8YZl0ly1S-0

![[Pasted image 20250614211828.png]]


# New User Stories
- modules can be equipped to units
- the same module can be equipped to multiple units in different content




---

# Technical Implementation Notes

1. Module Base Class
	1. Set Type (single enum value)
	2. Set Bonus (1,2,3)
	3. Rarity
	4. Main Stat
		1. stat_type (enum)
		2. stat_value
	5. Sub Stats (list, up to 4)
		1. stat_type (enum)
		2. stat_value
		3. upgrade_count (counter, up to 5)
	6. Equipped (list)
		1. which content
		2. which monster 
	7. Acquisition Time
	8. Level
2. Module List
	1. can be sorted by
		1. acquisition time
		2. level
		3. rarity
		4. sub_stats (single sort)
		5. set_bonus
	2. can be filtered by
		1. set_type
		2. sub_stats 





