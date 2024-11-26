local Translations = {
    company = {
        ['name'] = "Car Repair Station",
        ['not_enough_money'] = 'You don\'t have enough cash',
        ['cost_repair'] = 'You spent €%{amount} to repair vehicle',
        ['done_repair'] = 'Your vehicle has been repaired'
    },

    info = {
        ['press_repair_free'] = 'Press [E] to repair vehicle for free',
        ['press_repair_cost'] = 'Press [E]  cost €%{amount} to repair vehicle',
        ['repair_processing'] = 'Repair in progress, please wait...'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
