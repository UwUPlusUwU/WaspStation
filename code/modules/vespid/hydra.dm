//gonna have to mug some dude for hydra ruins
//totally not ripoff zerg

/obj/item/clothing/multistate/hydra
	list/armour_states = newlist(/datum/armour_state/hydra_rad) //Put your defined states in here.
	name = "Hydra Biomass"
	desc = "A mass of flesh and carapace. Creepy."
	icon = 'code/modules/vespid/wasprite.dmi'
	icon_state = "hydraarmor_armored"
	item_state = "hydralarva_armored"
	w_class = WEIGHT_CLASS_BULKY
	permeability_coefficient = 0.50
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/device/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/extinguisher, /obj/item/crowbar)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	flags_1 = STOPSPRESSUREDMAGE_1 | THICKMATERIAL_1
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 60
	equip_delay_other = 60
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	armor = list(melee = 75, bullet = 70, laser = 60, energy = 55, bomb = 25, bio = 0, rad = 0, fire = 70, acid = 0)

/datum/armour_state/hydra_rad
	state_name = "Rad-adapted Mutation"
	list/cached_armour
	list/cached_stats
	cached_icon_state
	cached_item_state
	/*
	format: resistance_flags,max_heat_protection_temperature,
	min_cold_protection_temperature,cold_protection,heat_protection,
	flags_cover, flash_protect,flags_inv,clothing_flags,body_parts_covered
	*/
	//Our new stats, when we switch to this state.
	list/new_armour = list(melee = 15, bullet = 10, laser = 5, energy = 5, bomb = 25, bio = 90, rad = 90, fire = 15, acid = 90) //Uses normal armour format
	list/new_stats = list(flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT,
							flags_1 = STOPSPRESSUREDMAGE_1 | THICKMATERIAL_1,
							heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS,
							max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT,
							cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS,
							min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT) //Utilise format for cached stats
	new_icon_state = "hydraarmor_rad"
	new_item_state = "hydralarva_rad"
