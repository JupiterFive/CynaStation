/obj/item/goldbar //deprecated, needs getting rid of except the map is being weird about it
	name = "fool's pyrite bar"
	desc = "It's gold that isn't. Except it is. MINDFUCK"
	icon = 'icons/obj/materials.dmi'
	icon_state = "gold-bar"
	force = 8
	throwforce = 10
	//metal = 1
	//conductor = 1
	New()
		src.material = getCachedMaterial("gold")
		return ..()

/datum/ore
	var/name = null
	var/output = null
	var/list/events = list()
	var/list/gems = list()
	var/rarity_tier = 1
	var/amount_per_tile_min = 1
	var/amount_per_tile_max = 3
	var/tiles_per_rock_min = 7
	var/tiles_per_rock_max = 25
	var/hardness_mod = 0
	var/event_chance = 8

	proc/set_up()
		return 0

	proc/onGenerate(var/turf/simulated/wall/asteroid/AST)
		if (!istype(AST))
			return 1

	proc/onHit(var/turf/simulated/wall/asteroid/AST)
		if (!istype(AST))
			return 1

	proc/onExcavate(var/turf/simulated/wall/asteroid/AST)
		if (!istype(AST))
			return 1

/datum/ore/mauxite
	name = "mauxite"
	output = /obj/item/raw_material/mauxite
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/gemstone,/obj/item/raw_material/uqill,/obj/item/raw_material/fibrilith)
	hardness_mod = 1

/datum/ore/pharosium
	name = "pharosium"
	output = /obj/item/raw_material/pharosium
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/gemstone,/obj/item/raw_material/uqill,/obj/item/raw_material/fibrilith)
	hardness_mod = 1

/datum/ore/molitz
	name = "molitz"
	output = /obj/item/raw_material/molitz
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/gemstone,/obj/item/raw_material/uqill,/obj/item/raw_material/fibrilith)
	hardness_mod = 1

/datum/ore/char
	name = "char"
	output = /obj/item/raw_material/char
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/gemstone,/obj/item/raw_material/fibrilith)
	tiles_per_rock_min = 6
	tiles_per_rock_max = 16
	amount_per_tile_min = 2
	amount_per_tile_max = 6
	hardness_mod = -1

/datum/ore/ice
	name = "ice"
	output = /obj/item/raw_material/ice
	hardness_mod = -2

/datum/ore/cobryl
	name = "cobryl"
	output = /obj/item/raw_material/cobryl
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/gemstone,/obj/item/raw_material/uqill,/obj/item/raw_material/miracle)
	tiles_per_rock_min = 4
	tiles_per_rock_max = 16
	hardness_mod = 2

/datum/ore/bohrum
	name = "bohrum"
	output = /obj/item/raw_material/bohrum
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/gemstone,/obj/item/raw_material/telecrystal,/obj/item/raw_material/miracle)
	tiles_per_rock_min = 4
	tiles_per_rock_max = 16
	hardness_mod = 3
	rarity_tier = 2

/datum/ore/claretine
	name = "claretine"
	output = /obj/item/raw_material/claretine
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/gemstone,/obj/item/raw_material/telecrystal,/obj/item/raw_material/miracle)
	tiles_per_rock_min = 4
	tiles_per_rock_max = 16
	hardness_mod = 3
	rarity_tier = 2

/datum/ore/viscerite
	name = "viscerite"
	output = /obj/item/raw_material/martian
	events = list()
	gems = list()
	event_chance = 0
	tiles_per_rock_min = 4
	tiles_per_rock_max = 16
	hardness_mod = 2
	rarity_tier = 2

/datum/ore/syreline
	name = "syreline"
	output = /obj/item/raw_material/syreline
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/gemstone,/obj/item/raw_material/telecrystal,/obj/item/raw_material/miracle)
	amount_per_tile_min = 2
	amount_per_tile_max = 3
	hardness_mod = 4
	rarity_tier = 3
	tiles_per_rock_min = 4
	tiles_per_rock_max = 10

/datum/ore/cerenkite
	name = "cerenkite"
	output = /obj/item/raw_material/cerenkite
	events = list(/datum/ore/event/gem,/datum/ore/event/radioactive)
	gems = list(/obj/item/raw_material/uqill,/obj/item/raw_material/miracle)
	hardness_mod = 3
	rarity_tier = 3
	event_chance = 15
	amount_per_tile_min = 1
	amount_per_tile_max = 2
	tiles_per_rock_min = 2
	tiles_per_rock_max = 8

	onHit(var/turf/simulated/wall/asteroid/AST)
		if (..())
			return
		for (var/mob/living/L in range(1,AST))
			L.irradiate(5)

	onExcavate(var/turf/simulated/wall/asteroid/AST)
		if (..())
			return
		for (var/mob/living/L in range(1,AST))
			L.irradiate(10)

/datum/ore/plasmastone
	name = "plasmastone"
	output = /obj/item/raw_material/plasmastone
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/uqill,/obj/item/raw_material/miracle)
	hardness_mod = 2
	rarity_tier = 3
	tiles_per_rock_min = 2
	tiles_per_rock_max = 8
	amount_per_tile_min = 1
	amount_per_tile_max = 2

/datum/ore/koshmarite
	name = "koshmarite"
	output = /obj/item/raw_material/eldritch
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/uqill,/obj/item/raw_material/miracle)
	event_chance = 12
	tiles_per_rock_min = 4
	tiles_per_rock_max = 16
	hardness_mod = 2
	rarity_tier = 3

/datum/ore/gold
	name = "gold"
	output = /obj/item/raw_material/gold
	events = list(/datum/ore/event/gem)
	gems = list(/obj/item/raw_material/gemstone,/obj/item/raw_material/telecrystal,/obj/item/raw_material/miracle)
	tiles_per_rock_min = 2
	tiles_per_rock_max = 8
	hardness_mod = 4
	rarity_tier = 3