//credits to XO-11 uwu

/obj/item/clothing/multistate

	var/datum/armour_state/current_armour_state
	var/list/armour_states = newlist() //Put your defined states in here.

/obj/item/clothing/multistate/New()
	. = ..()
	for(var/s in armour_states)
		var/datum/armour_state/armour_state = s
		armour_state.cache_initial_stats(src)

/obj/item/clothing/multistate/proc/get_states_readable()
	. = list()
	for(var/s in armour_states)
		var/datum/armour_state/armour_state = s
		. += armour_state.state_name

/obj/item/clothing/multistate/verb/switch_state()
	set name = "State Switch"
	set category = "Object"

	var/mob/living/user = usr
	if(!istype(user))
		return

	var/list/all_armour_states = get_states_readable()
	var/switch_to_name = input("What state do you want to switch to?","State Switch",) in all_armour_states + list("Cancel")
	if(switch_to_name == "Cancel")
		return
	var/state_index = all_armour_states.Find(switch_to_name)
	var/datum/armour_state/state_switch_to = armour_states[state_index]
	if(current_armour_state)
		current_armour_state.remove_state(src)
	state_switch_to.apply_state(src)
	current_armour_state = state_switch_to

/datum/armour_state
	var/state_name = "Armour State"
	var/list/cached_armour
	var/list/cached_stats
	var/cached_icon_state
	var/cached_item_state
	/*
	format: resistance_flags,max_heat_protection_temperature,
	min_cold_protection_temperature,cold_protection,heat_protection,
	flags_cover, flash_protect,flags_inv,clothing_flags,body_parts_covered
	*/
	//Our new stats, when we switch to this state.
	var/list/new_armour = list() //Uses normal armour format
	var/list/new_stats = list() //Utilise format for cached stats
	var/new_icon_state = "newstate"
	var/new_item_state = "newstate"

/datum/armour_state/proc/cache_initial_stats(var/obj/item/clothing/c)
	cached_icon_state = c.icon_state
	cached_item_state = c.item_state
	cached_armour = c.armor
	cached_stats = list(
	c.resistance_flags,
	c.max_heat_protection_temperature,
	c.min_cold_protection_temperature,
	c.cold_protection,
	c.heat_protection,
	c.flags_cover,
	c.flash_protect,
	c.flags_inv,
	c.flags_1,
	c.body_parts_covered
	)

/datum/armour_state/proc/apply_state(var/obj/item/clothing/c)
	c.icon_state = new_icon_state
	c.item_state = new_item_state
	c.armor = new_armour
	c.resistance_flags = new_stats[0]
	c.max_heat_protection_temperature = new_stats[1]
	c.min_cold_protection_temperature = new_stats[2]
	c.cold_protection = new_stats[3]
	c.heat_protection = new_stats[4]
	c.flags_cover = new_stats[5]
	c.flash_protect = new_stats[6]
	c.flags_inv = new_stats[7]
	c.flags_1 = new_stats[8]
	c.body_parts_covered = new_stats[9]

/datum/armour_state/proc/remove_state(var/obj/item/clothing/c)
	c.icon_state = cached_icon_state
	c.item_state = cached_item_state
	c.armor = new_armour
	c.resistance_flags = cached_stats[0]
	c.max_heat_protection_temperature = cached_stats[1]
	c.min_cold_protection_temperature = cached_stats[2]
	c.cold_protection = cached_stats[3]
	c.heat_protection = cached_stats[4]
	c.flags_cover = cached_stats[5]
	c.flash_protect = cached_stats[6]
	c.flags_inv = cached_stats[7]
	c.flags_1 = cached_stats[8]
	c.body_parts_covered = cached_stats[9]
