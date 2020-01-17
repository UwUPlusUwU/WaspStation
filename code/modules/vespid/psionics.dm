//psi amps gain abilities
//psi amp mods let you gain more abilities
//I hate myself

/datum/action/item_action/psionic
	name = "Psionic Template"
	desc = "You're not meant to see this."
	button_icon_state = "psion_template"
	icon_icon = 'code/modules/vespid/wasprite.dmi'



/obj/item/weapon/storage/belt/psionic
	name = "Psi Amp"
	desc = "Unlocks your inner potential.."
	icon_state = "pipesmg"
	item_state = "pipesmg"
	icon = 'code/modules/vespid/wasprite.dmi'
	can_hold = list(/obj/item/psichip)
	actions_types = list(/datum/action/item_action/toggle_helmet_light)

/obj/item/weapon/storage/belt/psionic/ui_action_click(mob/living/H, action)
  H.gib()

/obj/item/psichip
	name = "Psionic Chip"
	desc = "You're not meant to see this."
	icon_state = "pipesmg"
	item_state = "pipesmg"
	icon = 'code/modules/vespid/wasprite.dmi'
