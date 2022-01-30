local Translations = {
    system = {
       		['repaired']            = "Vehicle has been repaired",
        	['press_repair_free']   = 'Press ~INPUT_PICKUP~ to repair vehicle for free',
		['repair_finish']       = 'Vehicle has been repaired!',
		['repair_processing']   = 'Repair in progress, please wait...',
    },

    company = {
		['name']                = "Car Repair Station",
		['not_enough_money']    = 'You don\'t have enough cash',
		['cost_repair']         = 'You spent €%{amount} to repair vehicle',
	},

	info = {
		['press_repair_free']   = 'Press ~INPUT_PICKUP~ to repair vehicle for free',
		['press_repair_cost']   = 'Press ~INPUT_PICKUP~ cost €%{amount} to repair vehicle',
	},
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
