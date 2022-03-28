local Translations = {
    system = {
        ['repaired']            = "Voertuig is gerepareerd",
        ['press_repair_free']   = 'Druk op ~INPUT_PICKUP~ om het voertuig gratis repareren',
	['repair_finish']       = 'Voertuig is gerepareerd!',
	['repair_processing']   = 'Reparatie bezig, even geduld a.u.b...',
    },

    company = {
	    ['name']                = "Autoreparatiestation",
	    ['not_enough_money']    = 'Je hebt niet genoeg geld',
	    ['cost_repair']         = 'Je hebt €%{amount} uitgegeven om het voertuig te repareren',
	    ['done_repair']         = 'Je voertuig is gerepareerd',
    },

    info = {
	['press_repair_free']   = 'Druk op ~INPUT_PICKUP~ to repair vehicle for free',
	['press_repair_cost']   = 'Druk op ~INPUT_PICKUP~ kosten €%{amount} om het voertuig repareren',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
